require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe AppsController do

  def mock_app(stubs={})
    @mock_app ||= mock_model(APN::App, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all apps as @apps" do
      APN::App.stub(:all) { [mock_app] }
      get :index
      assigns(:apps).should eq([mock_app])
    end
  end

  describe "GET show" do
    it "assigns the requested app as @app" do
      APN::App.stub(:find).with("37") { mock_app }
      get :show, :id => "37"
      assigns(:app).should be(mock_app)
    end
  end

  describe "GET new" do
    it "assigns a new app as @app" do
      APN::App.stub(:new) { mock_app }
      get :new
      assigns(:app).should be(mock_app)
    end
  end

  describe "GET edit" do
    it "assigns the requested app as @app" do
      APN::App.stub(:find).with("37") { mock_app }
      get :edit, :id => "37"
      assigns(:app).should be(mock_app)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created app as @app" do
        APN::App.stub(:new).with({'these' => 'params'}) { mock_app(:save => true) }
        post :create, :app => {'these' => 'params'}
        assigns(:app).should be(mock_app)
      end

      it "redirects to the created app" do
        APN::App.stub(:new) { mock_app(:save => true) }
        post :create, :app => {}
        response.should redirect_to(app_url(mock_app))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved app as @app" do
        APN::App.stub(:new).with({'these' => 'params'}) { mock_app(:save => false) }
        post :create, :app => {'these' => 'params'}
        assigns(:app).should be(mock_app)
      end

      it "re-renders the 'new' template" do
        APN::App.stub(:new) { mock_app(:save => false) }
        post :create, :app => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested app" do
        APN::App.stub(:find).with("37") { mock_app }
        mock_app.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :app => {'these' => 'params'}
      end

      it "assigns the requested app as @app" do
        APN::App.stub(:find) { mock_app(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:app).should be(mock_app)
      end

      it "redirects to the app" do
        APN::App.stub(:find) { mock_app(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(app_url(mock_app))
      end
    end

    describe "with invalid params" do
      it "assigns the app as @app" do
        APN::App.stub(:find) { mock_app(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:app).should be(mock_app)
      end

      it "re-renders the 'edit' template" do
        APN::App.stub(:find) { mock_app(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested app" do
      APN::App.stub(:find).with("37") { mock_app }
      mock_app.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the apps list" do
      APN::App.stub(:find) { mock_app }
      delete :destroy, :id => "1"
      response.should redirect_to(apps_url)
    end
  end

end
