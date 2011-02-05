class User
  include Mongoid::Document

  field :name, :type => String
  field :auth_provider, :type => String
  field :auth_uid, :type => String

  references_many :links

  validates :auth_provider, :presence => true
  validates :auth_uid, :presence => true

  def self.create_with_twitter_auth(auth)
    create! do |user|
      user.auth_provider = auth['provider']
      user.auth_uid = auth['uid']
      user.name = auth['user_info']['name']
    end
  end
end
