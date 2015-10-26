require 'rails_helper'

RSpec.describe GroceriesController, type: :controller do
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

