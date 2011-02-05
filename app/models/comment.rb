class Comment
  include Mongoid::Document

  field :body, :type => String

  embedded_in :link, :inverse_of => :comments
  referenced_in :user

  validates :body, :presence => true
end
