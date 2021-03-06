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

    describe "for signed-in users"  do 
      let (:user) {FactoryGirl.create(:user)}
      before do
        FactoryGirl.create(:micropost,user:user, content:"Lorem ipsum")
        FactoryGirl.create(:micropost,user:user, content:"Dolor sit amet")
        sign_in user
        visit root_path
      end
      it "should render the user's feed" do
        user.feed.each do |item|
         page.should have_selector("li##{item.id}", text: item.content)
        end
      end
      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end
        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 follower", href: followers_user_path(user)) }
      end
    end
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
      it {should have_selector('h1', text: 'Contact')} 
      it {should_not have_selector('title',text: "Ruby on Rails Tutorial Sample App | Contact")}
    end
    
    describe "singup page" do
      before{visit signup_path}
      it {should_not have_selector('h1', text:'Sing up')}
      it {should_not have_selector('title', text:'Sign up')}
    end

    describe "profile page" do
      let(:user) { FactoryGirl.create(:user) }
      before { visit user_path(user) }
      # Code to make a user variable
      it { should_not have_selector('h1',text: user.name) }
      it { should_not have_selector('title', text: user.name) }
    end
 
    describe "signin page" do
      before { visit signin_path }
      it { should have_selector('h1',text: 'Sign in') }
      it { should_not have_selector('title', text: 'Sign in') }
    end

    #  it "should not have a custom page title" do
    #   visit root_path
    #  page.should not have_selector('title', text: '| Contact')
    # end 
end