require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :house_hold => nil,
      :name => "MyString",
      :active => ""
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_house_hold_id[name=?]", "category[house_hold_id]"

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_active[name=?]", "category[active]"
    end
  end
end
