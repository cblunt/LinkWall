class Favourite
  include Mongoid::Document

  referenced_in :user
  referenced_in :link

  validates :user_id, :presence => true
  validates :link_id, :presence => true
end
