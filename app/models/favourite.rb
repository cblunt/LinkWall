class Favourite
  include Mongoid::Document

  referenced_in :user
  referenced_in :link

  validates :user_id, :presence => true
  validates :link_id, :presence => true

  validate :not_already_favourite?

protected
  def not_already_favourite?
    errors[:base] << 'Already marked as favourite' unless Favourite.where(:user_id => self.user_id, :link_id => self.link_id).count.zero?
  end
end
