require 'spec_helper'

describe "devices/show.html.erb" do
  before(:each) do
    @device = assign(:device, stub_model(APN::Device,
      :token => "Token",
      :app_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Token/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
