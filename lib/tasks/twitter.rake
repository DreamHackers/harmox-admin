require 'twitter'

namespace :twitter do
  desc 'do tweet'
  task :tweet => :environment do

  end

  desc 'do retweet'
  task :retweet => :environment do
    Bot.find_by_alive.each do |bot|
      retweet(bot)
    end
  end

  desc 'do follow'
  task :follow => :environment do
    Bot.find_by_alive.each do |bot|
      follow(bot)
    end
  end

  # Twitter clientを生成する.
  #  Param::  Bot model
  #  Return:: Twitter Client
  def create_client(bot)
    client = Twitter::REST::Client.new(
      consumer_key:        Settings.twitter.consumer_key,
      consumer_secret:     Settings.twitter.consumer_secret,
      access_token:        bot.access_token,
      access_token_secret: bot.access_secret,
    )
  end

  def retweet(bot)
    client = create_client(bot)

    max_favorite_count = -1
    most_favorite_tweet = nil

    timeline = client.home_timeline(count: Settings.twitter.retweet_potential_number, exclude_replies: true, include_rts: true)

    timeline.each do |tweet|
      if(tweet.retweeted? == false && tweet.favorite_count > max_favorite_count)
        max_favorite_count = tweet.favorite_count
        most_favorite_tweet = tweet
      end
    end

    client.retweet(most_favorite_tweet)
    save_tracking(Models::BotType::RETWEET, most_favorite_tweet.text, bot.id)
  end

  def follow(bot)
    client = create_client(bot)

    word = ""

    bot.hash_tags.each do |hash_tag|
      word = word + " #" + hash_tag.hash_tag + ""
    end

    client.search(word + " -BOT -RT", result_type: "recent", lang: "ja", count: Settings.twitter.follow_potential_number).each do |tweet|
      unless tweet.user.following?
        client.follow(tweet.user.id)
        save_tracking(Models::BotType::FOLLOW, tweet.user.id, bot.id)
        break
      end
    end
  end

  def save_tracking(bot_type, content, bot_id)
    tracking_params = {
      bot_type: bot_type,
      content: content,
      bot_id: bot_id
    }

    tracking = RealtimeBotHashTagTracking.new(tracking_params)
    tracking.save
    write_log(bot_type, bot_id, content)
  end

  def write_log(type, bot_id, content)
    bot_type =
      case type
      when Models::BotType::TWEET; :tweet
      when Models::BotType::RETWEET;  :retweet
      when Models::BotType::FOLLOW; :follow
      else nil
      end

    #logはloggerを使う予定
    puts "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")} #{bot_type}:::bot=#{bot_id}, content=#{content}"
  end
end
