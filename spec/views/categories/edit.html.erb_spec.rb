require 'rails_helper'

RSpec.describe "categories/edit", type: :view do
  before(:each) do
    @category = assign(:category, Category.create!(
      :house_hold => nil,
      :name => "MyString",
      :active => ""
    ))
  end

  it "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(@category), "post" do

      assert_select "input#category_house_hold_id[name=?]", "category[house_hold_id]"

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "input#category_active[name=?]", "category[active]"
    end
  end
end
