class Comment
  include Mongoid::Document

  field :body, :type => String

  referenced_in :link
  referenced_in :user

  validates :body, :presence => true
end
