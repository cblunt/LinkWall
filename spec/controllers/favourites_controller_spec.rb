require 'spec_helper'

describe FavouritesController do
  describe "As an authenticated user" do
    before do
      @user = login
      @link = Factory(:link, :user => @user)
    end

    describe "POST 'create'" do
      describe "with valid attributes" do
        before do
          params = { :link_id => @link.id }
          post :create, params
        end

        it { should set_the_flash }
        it { should redirect_to(@link) }
      end

      describe "with invalid attributes" do
        before do
          post :create, {:link_id => '4d4c68445e370e507a000001'}
        end

        it { should redirect_to(root_url) }
      end
    end

    describe "DELETE 'destroy'" do
      describe "with valid attributes" do
        before do
          @link = Factory(:link)
          delete :destroy, :link_id => @link.id
        end

        it { should redirect_to(link_url(@link)) }
      end
    end
  end
end
