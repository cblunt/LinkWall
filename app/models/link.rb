class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url, :type => String

  references_many :comments, :dependent => :destroy
  references_many :favourites, :dependent => :destroy
  referenced_in :user

  validates :url, :presence => true
end
