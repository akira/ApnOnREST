require 'spec_helper'

describe "notifications/index.html.erb" do
  before(:each) do
    assign(:notifications, [
      stub_model(APN::Notification,
        :device_id => 1,
        :errors_nb => 1,
        :device_language => "Device Language",
        :sound => "Sound",
        :badge => 1,
        :custom_properties => "MyText"
      ),
      stub_model(APN::Notification,
        :device_id => 1,
        :errors_nb => 1,
        :device_language => "Device Language",
        :sound => "Sound",
        :badge => 1,
        :custom_properties => "MyText"
      )
    ])
  end

  it "renders a list of notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 6
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 6
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Device Language".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Sound".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 6
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
