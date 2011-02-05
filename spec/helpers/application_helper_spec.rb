require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the ApplicationHelper. For example:
#
# describe ApplicationHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe ApplicationHelper do
  describe "number_to_count" do
    it "returns pluralised 'No Objects' for zero" do
      helper.number_to_count(0, 'object').should eql 'No objects'
    end

    it "returns singular 'No object' for one" do
      helper.number_to_count(1, 'object').should eql '1 object'
    end

    it "returns pluralised '5 objects' for anything greater than 1" do
      helper.number_to_count(2, 'object').should eql '2 objects'
    end
  end
end
