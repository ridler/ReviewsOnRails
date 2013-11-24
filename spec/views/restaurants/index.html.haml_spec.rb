require 'spec_helper'

describe "restaurants/index" do
  before(:each) do
    assign(:restaurants, [
      stub_model(Restaurant,
        :name => "Name",
        :location => "Location",
        :averageRating => 1,
        :averagePrice => 2,
        :reviews => "MyText",
        :cuisine => "Cuisine"
      ),
      stub_model(Restaurant,
        :name => "Name",
        :location => "Location",
        :averageRating => 1,
        :averagePrice => 2,
        :reviews => "MyText",
        :cuisine => "Cuisine"
      )
    ])
  end

  it "renders a list of restaurants" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Cuisine".to_s, :count => 2
  end
end
