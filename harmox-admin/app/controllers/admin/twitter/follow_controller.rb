class Admin::Twitter::FollowController < ApplicationController
  include TwitterConcern

  def create
    follow_twitter_client(follow_params)
    redirect_to admin_bot_index_path
  end

  private
    def follow_params
      params.require(:follow).permit :bot_id
    end

    def follow_twitter_client(params)
      bot = Bot.find_by_id(params[:bot_id])

      client = create_client(bot)

      word = ""

      bot.hash_tags.each do |hash_tag|
        word = word + " #" + hash_tag.hash_tag + ""
      end

      client.search(word + " -BOT", result_type: "recent", lang: "ja", count: 1).take(10).each do |tweet|
        begin
          client.follow(tweet.user.id)
          save_tracking(Models::BotType::FOLLOW, tweet.user.id, bot.id)
          break
        rescue
          next
        end
      end
    end
end
