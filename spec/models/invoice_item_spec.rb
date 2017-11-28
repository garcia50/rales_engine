require 'rails_helper'

RSpec.describe InvoiceItem, type: :model do
  context "validations" do
    it { should validate_presence_of(:quantity) }
    it { should validate_presence_of(:unit_price) }
  end

  context "relationships" do
    it { should belong_to(:invoice) }
    it { should respond_to(:invoice) }
    it { should belong_to(:item) }
    it { should respond_to(:item) }
  end
end
