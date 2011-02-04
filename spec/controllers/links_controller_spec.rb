require 'spec_helper'

describe LinksController do
  describe "GET 'index'" do
    describe 'in general' do
      before do
        get :index
      end

      it { should assign_to(:links) }
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should_not set_the_flash }
    end

    describe 'ownership' do
      pending 'should only fetch links owned by the current user'
    end
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
