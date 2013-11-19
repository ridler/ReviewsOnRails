require 'spec_helper'

describe "reviews/new" do
  before(:each) do
    assign(:review, stub_model(Review,
      :user => "MyString",
      :business => "MyString",
      :stars => 1,
      :price => 1
    ).as_new_record)
  end

  it "renders new review form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reviews_path, "post" do
      assert_select "input#review_user[name=?]", "review[user]"
      assert_select "input#review_business[name=?]", "review[business]"
      assert_select "input#review_stars[name=?]", "review[stars]"
      assert_select "input#review_price[name=?]", "review[price]"
    end
  end
end
