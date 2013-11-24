require 'spec_helper'

describe "restaurants/edit" do
  before(:each) do
    @restaurant = assign(:restaurant, stub_model(Restaurant,
      :name => "MyString",
      :location => "MyString",
      :averageRating => 1,
      :averagePrice => 1,
      :reviews => "MyText",
      :cuisine => "MyString"
    ))
  end

  it "renders the edit restaurant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", restaurant_path(@restaurant), "post" do
      assert_select "input#restaurant_name[name=?]", "restaurant[name]"
      assert_select "input#restaurant_location[name=?]", "restaurant[location]"
      assert_select "input#restaurant_averageRating[name=?]", "restaurant[averageRating]"
      assert_select "input#restaurant_averagePrice[name=?]", "restaurant[averagePrice]"
      assert_select "textarea#restaurant_reviews[name=?]", "restaurant[reviews]"
      assert_select "input#restaurant_cuisine[name=?]", "restaurant[cuisine]"
    end
  end
end
