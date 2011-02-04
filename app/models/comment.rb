class Comment
  include Mongoid::Document

  field :body, :type => String
  embedded_in :link, :inverse_of => :comments

  validates :body, :presence => true
end
