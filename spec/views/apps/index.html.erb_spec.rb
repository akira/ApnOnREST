require 'spec_helper'

describe "apps/index.html.erb" do
  before(:each) do
    assign(:apps, [
      stub_model(APN::App,
        :apn_dev_cert => "MyText",
        :apn_prod_cert => "MyText"
      ),
      stub_model(APN::App,
        :apn_dev_cert => "MyText",
        :apn_prod_cert => "MyText"
      )
    ])
  end

  it "renders a list of apps" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "true".to_s, :count => 4
  end
end
