require 'spec_helper'

describe "reviews/index" do
  before(:each) do
    assign(:reviews, [
      stub_model(Review,
        :user => "User",
        :business => "Business",
        :stars => 1,
        :price => 2
      ),
      stub_model(Review,
        :user => "User",
        :business => "Business",
        :stars => 1,
        :price => 2
      )
    ])
  end

  it "renders a list of reviews" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Business".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
