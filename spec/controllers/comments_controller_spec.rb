require 'spec_helper'

describe CommentsController do
  describe "As an authenticated user" do
    before do
      @user = login

      @link = Factory(:link, :user => @user)
    end

    describe "GET 'new'" do
      before do
        get :new, :link_id => @link.id
      end

      it { should assign_to(:comment) }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should_not set_the_flash }

      it { assigns(:comment).should be_new_record }
    end

    describe "POST 'create'" do
      describe "with valid attributes" do
        before do
          params = { :link_id => @link.id, :comment => {
            :body => 'Lorem ipsum'
          }}

          post :create, params
        end

        it { should redirect_to(link_url(@link)) }
        it { should set_the_flash }
      end

      describe "with invalid attributes" do
        before do
          params = { :link_id => @link.id, :comment => {
            :body => ''
          }}

          post :create, params
        end

        it { should render_template(:new) }
        it { should respond_with(:success) }
        it { should_not set_the_flash }
      end
    end
  end
end
