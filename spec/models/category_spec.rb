require 'rails_helper'

RSpec.describe Category, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:category) { FactoryGirl.create(:category) }

  describe ".enable!" do
    it "activates a category" do
      category.update(active: false)
      category.enable!
      expect(category.active).to be_truthy
    end

    it "does nothing to an active category" do
      category.update(active: true)
      category.disable!
      expect(category.active).to be_falsey
    end

  end

  describe ".disable!" do
    it "deactivates a category"
    it "does nothing to a deactivated category"
  end
end

