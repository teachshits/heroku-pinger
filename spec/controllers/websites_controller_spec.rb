require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WebsitesController do

  before (:each) do
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter] 
    # this works: 
    # @user = FactoryGirl.create(:user)
    # this also works:
    # @user = User.new( :provider => "twitter", :uid => "12345", :name => "the user")
    # @user.save
  end
  let (:user) {
     FactoryGirl.create(:user)
  }

  # This should return the minimal set of attributes required to create a valid
  # Website. As you add validations to Website, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :user_id => 1,
      :url => "http://valid-url-0000.herokuapp.com/users/1/edit"
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WebsitesController. Be sure to keep this updated too.
  def valid_session
    {
      # good: "user_id"=> @user.id
      "user_id"=> user.id
      
    }
  end

  def invalid_session 
    { 
    "user_id" => 5 
  }
    end

  describe "GET index" do
    it "assigns all websites as @websites" do
      # puts "valid_attributes: #{valid_attributes.to_s}"
      website = Website.create! valid_attributes
      get :index, {}, valid_session
      assigns(:websites).should eq([website])
    end
  end

  describe "GET show" do
    it "assigns the requested website as @website" do
      website = Website.create! valid_attributes
      get :show, {:id => website.to_param}, valid_session
      assigns(:website).should eq(website)
    end
  end

  describe "GET new" do
    it "assigns a new website as @website" do
      get :new, {}, valid_session
      assigns(:website).should be_a_new(Website)
    end
  end

  describe "GET edit" do
    it "assigns the requested website as @website" do
      website = Website.create! valid_attributes
      get :edit, {:id => website.to_param}, valid_session
      assigns(:website).should eq(website)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Website" do
        # puts "valid_attributes: #{valid_attributes}"
        # puts "valid_attributes.class: #{valid_attributes.class}"
        # puts "valid_session: #{valid_session}"
        # puts "valid_session.class: #{valid_session.class}"
        session[:user_id] = 1
        expect {
          # ORIG: 
          post :create, {:website => valid_attributes}, valid_session
          # post :create, {:website => valid_attributes}, session[:user_id]
        }.to change(Website, :count).by(1)
      end

      it "assigns a newly created website as @website" do
        post :create, {:website => valid_attributes}, valid_session
        assigns(:website).should be_a(Website)
        assigns(:website).should be_persisted
      end
=begin
      it "adfdfdfdf assigns a newly created website as @website" do
        post :create, {:website => valid_attributes}, invalid_session
        assigns(:website).should_not be_a(Website)
        assigns(:website).should_not be_persisted
      end
=end
      it "redirects to the created website" do
        post :create, {:website => valid_attributes}, valid_session
        response.should redirect_to(Website.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved website as @website" do
        # Trigger the behavior that occurs when invalid params are submitted
        Website.any_instance.stub(:save).and_return(false)
        post :create, {:website => {}}, valid_session
        assigns(:website).should be_a_new(Website)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Website.any_instance.stub(:save).and_return(false)
        post :create, {:website => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested website" do
        website = Website.create! valid_attributes
        # Assuming there are no other websites in the database, this
        # specifies that the Website created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Website.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => website.to_param, :website => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested website as @website" do
        website = Website.create! valid_attributes
        put :update, {:id => website.to_param, :website => valid_attributes}, valid_session
        assigns(:website).should eq(website)
      end

      it "redirects to the website" do
        website = Website.create! valid_attributes
        put :update, {:id => website.to_param, :website => valid_attributes}, valid_session
        response.should redirect_to(website)
      end
    end

    describe "with invalid params" do
      it "assigns the website as @website" do
        website = Website.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Website.any_instance.stub(:save).and_return(false)
        put :update, {:id => website.to_param, :website => {}}, valid_session
        assigns(:website).should eq(website)
      end

      it "re-renders the 'edit' template" do
        website = Website.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Website.any_instance.stub(:save).and_return(false)
        put :update, {:id => website.to_param, :website => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested website" do
      website = Website.create! valid_attributes
      expect {
        delete :destroy, {:id => website.to_param}, valid_session
      }.to change(Website, :count).by(-1)
    end

    it "redirects to the websites list" do
      website = Website.create! valid_attributes
      delete :destroy, {:id => website.to_param}, valid_session
      response.should redirect_to(websites_url)
    end
  end

end
