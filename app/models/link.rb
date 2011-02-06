class Link
  include Mongoid::Document
  include Mongoid::Timestamps

  field :url, :type => String

  references_many :comments, :dependent => :destroy
  references_many :favourites, :dependent => :destroy
  referenced_in :user

  validates :url, :presence => true

  def favourite_for_user(user_id)
    ! Favourites.first(:link_id => self.id, :user_id => user_id).limit(1).count.zero?
  end
end
