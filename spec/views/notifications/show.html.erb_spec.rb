require 'spec_helper'

describe "notifications/show.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :device_id => 1,
      :errors_nb => 1,
      :device_language => "Device Language",
      :sound => "Sound",
      :badge => 1,
      :custom_properties => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Device Language/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Sound/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
