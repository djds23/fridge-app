require "rails_helper"

RSpec.describe Grocery, :type => :model do

  describe "#down_quantity!" do
    let(:lots_of_pizza) { FactoryGirl.create(:grocery, quantity: 5) }
    it "properly lowers quantity" do
      lots_of_pizza.down_quantity!
      expect(lots_of_pizza.quantity).to eq(1)

      lots_of_pizza.down_quantity!
      expect(lots_of_pizza.quantity).to eq(0)

      # can't go lower than 0
      lots_of_pizza.down_quantity!
      expect(lots_of_pizza.quantity).to eq(0)
    end
  end

  describe "#up_quantity!" do
    let(:out_of_pizza) { FactoryGirl.create(:grocery, quantity: 0) }
    it "properly raises quantity" do
      out_of_pizza.up_quantity!
      expect(out_of_pizza.quantity).to eq(1)

      out_of_pizza.up_quantity!
      expect(out_of_pizza.quantity).to eq(5)

      # can't go higher than 5 
      out_of_pizza.up_quantity!
      expect(out_of_pizza.quantity).to eq(5)
    end
  end
  
  describe 'status methods' do
    let(:grocery) { FactoryGirl.create(:grocery, quantity: 0) }    
    it 'is out of stock' do
      expect(grocery.out_of_stock?).to be_true
    end
    
    it 'is running low' do
      grocery.up_quantity!
      expect(grocery.running_low?).to be_true
    end
    
    
    it 'is in stock' do
      grocery.up_quantity!
      expect(grocery.in_stock?).to be_true
    end
  end
end

