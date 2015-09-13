module Admin::BotHashTagRelsHelper
  def bot_hash_tag_rels?
    bot_hash_tag_rels
  end

  def bot_hash_tag_rels
    @bot_hash_tag_rels ||= BotHashTagRel.find_by_alive
  end
end
