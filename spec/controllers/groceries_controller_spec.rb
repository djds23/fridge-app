require 'rails_helper'

RSpec.describe GroceriesController, type: :controller do

  describe 'GET index' do
    let!(:category) { FactoryGirl.create(:category) }
    let!(:garlic)   { FactoryGirl.create(:grocery, :in_stock, item_name: 'Garlic', category_id: category.id) }
    let!(:pizza)    { FactoryGirl.create(:grocery, :running_low, item_name: 'Pizza', category_id: category.id) }
    let!(:onions)   { FactoryGirl.create(:grocery, :out_of_stock, item_name: 'Onions',category_id: category.id) }

    it 'Creates a properly formatted hash' do
      get :index
      categories = controller.instance_variable_get(:@categories)
      expect(categories.count).to eq(Category.where(id: category.id).count)
    end
  end

  describe 'POST up_quantity!' do
    let(:grocery) { FactoryGirl.create(:grocery, quantity: 000) }
    it 'properly increments the quantity' do
      post :quantity, format: 'json', grocery: { id: grocery.id, direction: 'up' }
      expect(grocery.reload.in_stock?).to be_truthy
    end
  end

  describe 'POST down_quantity!' do
    let(:grocery) { FactoryGirl.create(:grocery, quantity: 200) }
    it 'properly increments the quantity' do
      post :quantity, format: 'json', grocery: { id: grocery.id, direction: 'down' }
      expect(grocery.reload.running_low?).to be_truthy
    end
  end
end

