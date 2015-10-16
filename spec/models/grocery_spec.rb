require "rails_helper"

RSpec.describe Grocery, :type => :model do
  let(:out_of_pizza) { FactoryGirl.create(:grocery, quantity: 0) }
  let(:lots_of_pizza) { FactoryGirl.create(:grocery, quantity: 5) }

  describe "#down_quantity!" do
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
end

