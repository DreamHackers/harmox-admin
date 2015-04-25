class Admin::Twitter::TweetController < ApplicationController
  include TwitterConcern

  def create
    update_twitter_client(tweet_params)
    redirect_to admin_bot_index_path
  end

  private
    def tweet_params
      params.require(:tweet).permit :bot_id, :content
    end

    def update_twitter_client(params)
      bot = Bot.find_by_id(params[:bot_id])

      content = params[:content]

      client = create_client(bot)
      client.update(content)

      save_tracking(Models::BotType::TWEET, content, bot.id)
    end
end
