require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the UsersHelper. For example:
#
# describe UsersHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
  describe UsersHelper do
    describe "with valid information" do	  
  	  describe "after saving the user" do
  	  	it { should_not have_link('Sign out') }
	  end
    end
end

