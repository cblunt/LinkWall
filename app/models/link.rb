class Link
  include Mongoid::Document

  field :url, :type => String
  embeds_many :comments

  validates :url, :presence => true
end
