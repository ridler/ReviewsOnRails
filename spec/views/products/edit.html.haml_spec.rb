require 'spec_helper'

describe "products/edit" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :reviews => "MyText",
      :averageRating => 1,
      :category => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_path(@product), "post" do
      assert_select "textarea#product_reviews[name=?]", "product[reviews]"
      assert_select "input#product_averageRating[name=?]", "product[averageRating]"
      assert_select "input#product_category[name=?]", "product[category]"
    end
  end
end
