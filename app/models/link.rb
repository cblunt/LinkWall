class Link
  include Mongoid::Document

  field :url, :type => String

  references_many :comments
  referenced_in :user

  validates :url, :presence => true
end
