require 'spec_helper'

describe WallController do
  describe 'in general' do
    before do
      3.times { Factory(:link) }

      get :index
    end

    it { should assign_to(:links) }
    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should_not set_the_flash }
    
    it 'should fetch every link' do
      assigns(:links).count.should eql Link.count
    end
  end
end
