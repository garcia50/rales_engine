require 'rails_helper'

RSpec.describe Item, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  context "relationsips" do
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should belong_to(:merchant) }
  end

  context "business analytics" do
    describe "self.most_revenue" do
      it "returns the top x items ranked by total revenue generated" do
        cool_item, item_2 = create_list(:item, 2)
        invoice = create(:invoice)

        create(:invoice_item, item:    cool_item, invoice: invoice, unit_price: 1000)
        create(:invoice_item, item:    item_2,    invoice: invoice, unit_price: 1)
        create(:transaction,  invoice: invoice,   result:  "success")

        expect(Item.most_revenue(2).first).to eq(cool_item)
        expect(Item.most_revenue(2).last).to eq(item_2)
      end
    end
  end
end
