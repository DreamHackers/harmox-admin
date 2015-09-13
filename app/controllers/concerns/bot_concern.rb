module BotConcern
  def bot_new
    @bot = Bot.new
  end

  # Twitter sessionを削除する.
  def delete_authinfo_to_session
    session.delete(:access_token)
    session.delete(:access_secret)
    session.delete(:twitter_id)
    session.delete(:twitter_name)
  end
end
