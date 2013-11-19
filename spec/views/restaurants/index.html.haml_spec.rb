require 'spec_helper'

describe "restaurants/index" do
  before(:each) do
    assign(:restaurants, [
      stub_model(Restaurant,
        :location => "Location",
        :phone => "Phone",
        :webpage => "Webpage",
        :cuisine => "Cuisine",
        :priceAverage => 1
      ),
      stub_model(Restaurant,
        :location => "Location",
        :phone => "Phone",
        :webpage => "Webpage",
        :cuisine => "Cuisine",
        :priceAverage => 1
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Webpage".to_s, :count => 2
    assert_select "tr>td", :text => "Cuisine".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
