class Bot < ActiveRecord::Base
  has_many :bot_hash_tag_rels
  has_many :hash_tags, :through => :bot_hash_tag_rels

  validates :twitter_name, presence: true
  validates :twitter_id, presence: true
  validates :access_token, presence: true
  validates :access_secret, presence: true

  # 論理削除されていないレコードを全取得
  def self.find_by_alive
    Bot.where(deleted: false)
  end

  def self.find_by_id(id)
    Bot.where(id: id).first
  end

end
