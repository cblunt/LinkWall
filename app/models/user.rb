class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :auth_provider, :type => String
  field :auth_uid, :type => String

  references_many :links, :dependent => :destroy
  references_many :comments, :dependent => :destroy
  references_many :favourites, :dependent => :destroy

  validates :auth_provider, :presence => true
  validates :auth_uid, :presence => true

  def self.create_with_twitter_auth(auth)
    create! do |user|
      user.auth_provider = auth['provider']
      user.auth_uid = auth['uid']
      user.name = auth['user_info']['name']
    end
  end

  def favourite_ids
    @favourite_ids ||= Favourite.where(:user_id => self.id).collect (&:link_id)
  end

  def favourite?(link)
    favourite_ids.include?(link.id)
  end
end
