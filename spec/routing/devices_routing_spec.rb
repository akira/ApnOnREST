require "spec_helper"

describe DevicesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/devices" }.should route_to(:controller => "devices", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/devices/new" }.should route_to(:controller => "devices", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/devices/1" }.should route_to(:controller => "devices", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/devices/1/edit" }.should route_to(:controller => "devices", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/devices" }.should route_to(:controller => "devices", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/devices/1" }.should route_to(:controller => "devices", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/devices/1" }.should route_to(:controller => "devices", :action => "destroy", :id => "1")
    end

  end
end
