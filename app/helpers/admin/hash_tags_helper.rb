module Admin::HashTagsHelper
  def hash_tags?
    hash_tags
  end

  def hash_tags
    @hash_tags ||= HashTag.find_by_alive
  end
end
