class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, :type => String
  field :auth_provider, :type => String
  field :auth_uid, :type => String

  references_many :links, :dependent => :destroy
  references_many :comments, :dependent => :destroy
  references_many :favourites, :dependent => :destroy do
    def ids
      @target.collect(&:link_id)
    end

    def links
      @target.collect { |f| f.link }
    end
  end

  validates :auth_provider, :presence => true
  validates :auth_uid, :presence => true

  def self.create_with_auth(auth)
    create! do |user|
      user.auth_provider = auth['provider']
      user.auth_uid = auth['uid']
      user.name = auth['user_info']['name']
    end
  end

  def favourite?(link)
    self.favourites.ids.include?(link.id)
  end
end
