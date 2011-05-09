require 'spec_helper'

describe "notifications/new.html.erb" do
  before(:each) do
    assign(:notification, stub_model(APN::Notification,
      :device_id => 1,
      :errors_nb => 1,
      :device_language => "MyString",
      :sound => "MyString",
      :badge => 1,
      :custom_properties => "MyText"
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => notifications_path, :method => "post" do
      assert_select "input#notification_device_id", :name => "notification[device_id]"
      assert_select "input#notification_errors_nb", :name => "notification[errors_nb]"
      assert_select "input#notification_device_language", :name => "notification[device_language]"
      assert_select "input#notification_sound", :name => "notification[sound]"
      assert_select "input#notification_badge", :name => "notification[badge]"
      assert_select "textarea#notification_custom_properties", :name => "notification[custom_properties]"
    end
  end
end
