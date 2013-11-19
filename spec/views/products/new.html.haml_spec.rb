require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :reviews => "MyText",
      :averageRating => 1,
      :category => "MyString"
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "textarea#product_reviews[name=?]", "product[reviews]"
      assert_select "input#product_averageRating[name=?]", "product[averageRating]"
      assert_select "input#product_category[name=?]", "product[category]"
    end
  end
end
