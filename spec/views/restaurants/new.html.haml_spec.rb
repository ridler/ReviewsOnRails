require 'spec_helper'

describe "restaurants/new" do
  before(:each) do
    assign(:restaurant, stub_model(Restaurant,
      :location => "MyString",
      :phone => "MyString",
      :webpage => "MyString",
      :cuisine => "MyString",
      :priceAverage => 1
    ).as_new_record)
  end

  it "renders new restaurant form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", restaurants_path, "post" do
      assert_select "input#restaurant_location[name=?]", "restaurant[location]"
      assert_select "input#restaurant_phone[name=?]", "restaurant[phone]"
      assert_select "input#restaurant_webpage[name=?]", "restaurant[webpage]"
      assert_select "input#restaurant_cuisine[name=?]", "restaurant[cuisine]"
      assert_select "input#restaurant_priceAverage[name=?]", "restaurant[priceAverage]"
    end
  end
end
