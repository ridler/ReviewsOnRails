require 'spec_helper'

describe "reviews/show" do
  before(:each) do
    @review = assign(:review, stub_model(Review,
      :user => "User",
      :business => "Business",
      :stars => 1,
      :price => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/User/)
    rendered.should match(/Business/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
