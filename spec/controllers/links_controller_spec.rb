require 'spec_helper'

describe LinksController do
  describe "GET 'index'" do
    before do
      get :index
    end

    it { should assign_to(:links) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
  end
end
