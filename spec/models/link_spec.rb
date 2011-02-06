require 'spec_helper'

describe Link do
  it { should validate_presence_of(:url) }

  describe 'favourite_for_user' do
    before do
      @user = Factory(:user)
      @link = Factory(:link)
    end

    it 'should be false if it is not marked as favourite by the given user' do
      @link.favourite_for_user(@user.id).should be_false
    end

    it 'should be true if it is marked as favourite by the given user' do
      @user.favourites.create!(:link => @link)
      @link.favourite_for_user(@user.id).should be_true
    end
  end
end
