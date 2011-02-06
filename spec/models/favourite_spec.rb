require 'spec_helper'

describe Favourite do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:link_id) }
end
