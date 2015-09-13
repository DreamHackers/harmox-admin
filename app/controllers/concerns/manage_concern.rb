module ManageConcern
  include BotConcern

  # 全てのセッションが削除される
  def rm_all_sessions
    delete_authinfo_to_session
  end
end
