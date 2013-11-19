require 'spec_helper'

describe "restaurants/show" do
  before(:each) do
    @restaurant = assign(:restaurant, stub_model(Restaurant,
      :location => "Location",
      :phone => "Phone",
      :webpage => "Webpage",
      :cuisine => "Cuisine",
      :priceAverage => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
    rendered.should match(/Phone/)
    rendered.should match(/Webpage/)
    rendered.should match(/Cuisine/)
    rendered.should match(/1/)
  end
end
