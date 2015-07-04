require 'oauth'

class Bot::BotsController < ApplicationController
  include BotConcern

  def show
  end

  def new
    bot_new
  end

  def create
    bot = set_twitter_info
    render action: 'admin/bot/new', alert: "登録失敗!!" if bot.nil?

    if bot.save
      delete_authinfo_to_session
      redirect_to(admin_bot_index_path, notice: "登録完了!!")
    else
      bot_new
      render 'admin/bot/new'
    end
  end

  def destroy
    bot = find_destroy_bot
    if bot.save
      flash[:delete] =  "論理削除完了!!"
      redirect_to admin_bot_index_path
    else
      render 'admin/bot/index'
    end
  end

  def callback
    auth = request.env["omniauth.auth"]

    save_authinfo_to_session(auth)

    redirect_to admin_bot_index_path
  end

  private
    def set_twitter_info
      bot = Bot.new
      bot.access_token = session[:access_token]
      bot.access_secret = session[:access_secret]
      bot.twitter_id = session[:twitter_id]
      bot.twitter_name = session[:twitter_name]
      bot
    end

    def find_destroy_bot
      Bot.find_by_id(params[:id]).tap do |bot|
        bot.twitter_id = bot.twitter_id.blank? ? Controllers::Bot::NG : bot.twitter_id
        bot.twitter_name = bot.twitter_name.blank? ? Controllers::Bot::NG : bot.twitter_name
        bot.access_token = bot.access_token.blank? ? Controllers::Bot::NG : bot.access_token
        bot.hash_tags = bot.hash_tags.blank? ? Controllers::Bot::NG : bot.hash_tags
        bot.deleted = true
      end
    end

    def save_authinfo_to_session(auth)
      token = auth[:credentials]

      session[:access_token] = token[:token]
      session[:access_secret] = token[:secret]

      info = auth[:info]

      session[:twitter_id] = info[:nickname]
      session[:twitter_name] = info[:name]
    end
end
