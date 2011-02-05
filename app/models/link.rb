class Link
  include Mongoid::Document

  field :url, :type => String

  embeds_many :comments
  referenced_in :user

  validates :url, :presence => true
end
