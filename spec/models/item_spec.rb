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

    describe "self.most_quantity" do
      it "returns the top x items ranked by total quantity sold" do
        item_1 = create(:item)
        item_2 = create(:item)
        invoice = create(:invoice)

        create(:invoice_item, item:    item_1, invoice: invoice, quantity: 1000)
        create(:invoice_item, item:    item_2,    invoice: invoice, quantity: 1)
        create(:transaction,  invoice: invoice,   result:  "success")

        expect(Item.most_quantity(1).first).to eq(item_1)
      end
    end


    describe "#best_day" do
      it "returns the date with the most sales for the given item using the invoice date" do
        items = create(:item)
        invoice_1 = create(:invoice, created_at: "2012-03-27 14:53:59 UTC")
        invoice_2 = create(:invoice, created_at: "2012-03-27 14:53:59 UTC")
        invoice_3 = create(:invoice, created_at: "2012-04-27 14:53:59 UTC")


        create(:invoice_item, item: items, invoice: invoice_1, quantity: 10)
        create(:invoice_item, item: items, invoice: invoice_2, quantity: 1)
        create(:invoice_item, item: items, invoice: invoice_3, quantity: 5)
        create(:transaction,  invoice: invoice_1,   result:  "success")
        create(:transaction,  invoice: invoice_2,   result:  "success")
        create(:transaction,  invoice: invoice_3,   result:  "success")

        expect(items.best_day).to eq(invoice_1.created_at)

      end
    end
  end
end
