class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body, :type => String

  referenced_in :link
  referenced_in :user

  validates :body, :presence => true
end
