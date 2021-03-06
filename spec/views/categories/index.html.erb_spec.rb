require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        :house_hold => nil,
        :name => "Name",
        :active => ""
      ),
      Category.create!(
        :house_hold => nil,
        :name => "Name",
        :active => ""
      )
    ])
  end

  xit "renders a list of categories" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
