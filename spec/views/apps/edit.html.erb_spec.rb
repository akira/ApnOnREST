require 'spec_helper'

describe "apps/edit.html.erb" do
  before(:each) do
    @app = assign(:app, stub_model(App,
      :apn_dev_cert => "MyText",
      :apn_prod_cert => "MyText"
    ))
  end

  it "renders the edit app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => app_path(@app), :method => "post" do
      assert_select "textarea#app_apn_dev_cert", :name => "app[apn_dev_cert]"
      assert_select "textarea#app_apn_prod_cert", :name => "app[apn_prod_cert]"
    end
  end
end
