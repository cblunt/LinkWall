require 'spec_helper'

describe LinksController do
  describe "As an authenticated user" do
    before do
      @user = login

      @link = Factory(:link, :user => @user)
      @user.links << @link
      @user.links << Factory(:link)

      @other_user = Factory(:user)
      @other_link = Factory(:link, :user => @other_user)
    end

    describe "GET 'index'" do
      describe 'in general' do
        before do
          get :index
        end

        it { should assign_to(:links) }
        it { should assign_to(:comments) }
        it { should respond_with(:success) }
        it { should render_template(:index) }
        it { should_not set_the_flash }
      end

      describe 'ownership' do
        before do
          get :index
        end
        
        it { assigns(:links).should include @link }
        it { assigns(:links).should_not include @other_link }
      end
    end

    describe "GET 'show'" do
        before do
          @link = Factory(:link)

          get :show, :id => @link.id
        end

        it { should assign_to(:link) }
        it { should assign_to(:comments) }
        it { should respond_with(:success) }
        it { should render_template(:show) }
        it { should_not set_the_flash }
    end

    describe "GET 'new'" do
      before do
        get :new
      end

      it { should assign_to(:link) }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should_not set_the_flash }

      it { assigns(:link).should be_new_record }
    end

    describe "POST 'create'" do
      describe "with valid attributes" do
        before do
          params = { :link => Factory.attributes_for(:link) }
          post :create, params
        end

        it { should redirect_to(:links) }
        it { should set_the_flash }
      end

      describe "with invalid attributes" do
        before do
          params = { :link => Factory.attributes_for(:invalid_link) }
          post :create, params
        end

        it { should render_template(:new) }
        it { should respond_with(:success) }
      end
    end

    describe "DELETE 'destroy'" do
      describe "with valid attributes" do
        before do
          @link = Factory(:link)
          delete :destroy, :id => @link.id
        end

        it { should assign_to(:link) }
        it { should redirect_to(:links) }
        it { should set_the_flash }
        it { Link.criteria.id(@link.id).count.should be_zero }
      end
    end
  end
end
