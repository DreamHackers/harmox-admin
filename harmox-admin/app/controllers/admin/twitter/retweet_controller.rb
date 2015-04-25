class Admin::Twitter::RetweetController < ApplicationController
  include TwitterConcern

  def create
    retweet_twitter_client(retweet_params)
    redirect_to admin_bot_index_path
  end

  private
    def retweet_params
      params.require(:retweet).permit :bot_id
    end

    def retweet_twitter_client(params)
      bot = Bot.find_by_id(params[:bot_id])

      client = create_client(bot)

      max_favorite_count = -1
      most_favorite_tweet = nil

      client.home_timeline(count: 100, exclude_replies: true, include_rts: true).each do |tweet|
        if(tweet.favorite_count > max_favorite_count)
          max_favorite_count = tweet.favorite_count
          most_favorite_tweet = tweet
        end
      end

      client.retweet(most_favorite_tweet)

      save_tracking(Models::BotType::RETWEET, most_favorite_tweet.text, bot.id)
    end
end
