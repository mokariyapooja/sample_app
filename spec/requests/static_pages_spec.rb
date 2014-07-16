#require 'spec_helper'

#describe "StaticPages" do
  #describe "GET /static_pages" do
    #it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     # get static_pages_index_path
    #  response.status.should be(200)
   # end
  #end
#end

require 'spec_helper'

describe "Static pages" do

  subject{page}

  describe "Home page" do

    before {visit root_path}

    it {should have_selector('h1', text: 'Sample App')}
    it {should_not have_selector('title',text: "Ruby on Rails Tutorial Sample App")}   
    it {should_not have_selector('title', text: '| home')}
    end
   
    # it "should have the h1 'Sample App'" do
    #   visit root_path
    #   page.should have_selector('h1', :text => 'Sample App')
    # end
    # it "should have the base title" do
    #   visit root_path
    #   page.should have_selector('title', :text => "Ruby on Rails Tutorial Sample App")
    # end

  #end

  describe "Help page" do
    before {visit help_path}
    it {should have_selector('h1', text: 'Help')}
    it {should_not have_selector('title',text: "Ruby on Rails Tutorial Sample App | Help")}
    end


    # it "should not have a custom page title" do
    #   visit about_path
    #  page.should not have_selector('title', text: '| Help')
    # end
  #end

  describe "About page" do
    before {visit about_path}
    it {should have_selector('h1', text: 'About Us')}
    it {should_not have_selector('title',text: "Ruby on Rails Tutorial Sample App | about")}
  end

    # it "should not have a custom page title" do
    #   visit about_path
    #  page.should not have_selector('title', text: '| About Us')
    # end
  #end
 
  describe "Contact page" do
      before {visit contact_path}
     it {page.should have_selector('h1', text: 'Contact')} 
     it {page.should_not have_selector('title',text: "Ruby on Rails Tutorial Sample App | Contact")}
    end

    #  it "should not have a custom page title" do
    #   visit root_path
    #  page.should not have_selector('title', text: '| Contact')
    # end
 #end
end