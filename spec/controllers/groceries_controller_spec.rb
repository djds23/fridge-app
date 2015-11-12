require 'rails_helper'

RSpec.describe GroceriesController, type: :controller do

  describe 'GET index' do
    let!(:category) { FactoryGirl.create(:category) }
    let!(:garlic)   { FactoryGirl.create(:grocery, :in_stock, category_id: category.id) }
    let!(:pizza)    { FactoryGirl.create(:grocery, :running_low, category_id: category.id) }
    let!(:onions)   { FactoryGirl.create(:grocery, :out_of_stock, category_id: category.id) }
    let(:expected_hash) do
      { "Groceries" => {
          in_stock: Grocery.where(id: garlic.id),
          running_low: Grocery.where(id: pizza.id),
          onions: Grocery.where(id: onions.id),
        }
      }
    end

    it 'Creates a properly formatted hash' do
      get :index
      assigns(:grocery_by_category_hash).should be_a(Hash)
      assigns(:grocery_by_category_hash).should == expected_hash
    end
  end

  describe 'POST up_quantity!' do
    let(:grocery) { FactoryGirl.create(:grocery, quantity: 0) }
    it 'properly increments the quantity' do
      post :quantity, format: 'json', grocery: { id: grocery.id, direction: 'up' }
      expect(grocery.reload.running_low?).to be_truthy
    end
  end

  describe 'POST down_quantity!' do
    let(:grocery) { FactoryGirl.create(:grocery, quantity: 5) }
    it 'properly increments the quantity' do
      post :quantity, format: 'json', grocery: { id: grocery.id, direction: 'down' }
      expect(grocery.reload.running_low?).to be_truthy
    end
  end
end

