require 'spec_helper'

describe "devices/edit.html.erb" do
  before(:each) do
    @device = assign(:device, stub_model(APN::Device,
      :token => "MyString",
      :app_id => 1
    ))
  end

  it "renders the edit device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => device_path(@device), :method => "post" do
      assert_select "input#device_token", :name => "device[token]"
      assert_select "input#device_app_id", :name => "device[app_id]"
    end
  end
end
