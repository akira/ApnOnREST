require 'spec_helper'

describe "devices/new.html.erb" do
  before(:each) do
    assign(:device, stub_model(Device,
      :token => "MyString",
      :app_id => 1
    ).as_new_record)
  end

  it "renders new device form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => devices_path, :method => "post" do
      assert_select "input#device_token", :name => "device[token]"
      assert_select "input#device_app_id", :name => "device[app_id]"
    end
  end
end
