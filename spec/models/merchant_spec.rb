require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "validations" do
    it { should validate_presence_of(:name) }
  end

  context "relationsips" do
    it { should have_many(:invoices) }
    it { should have_many(:items) }
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:invoice_items).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }

  end

  context "business analytics" do
    describe "#favorite_customer" do
      it "loads favorite customer associated with one merchant" do
        merchant      = create :merchant
        cool_customer = create :customer
        weak_customer = create :customer
        invoice_1     = create :invoice, merchant: merchant, customer: cool_customer
        invoice_2     = create :invoice, merchant: merchant, customer: weak_customer

        create_list(:transaction, 4, result: 'success', invoice: invoice_1)
        create_list(:transaction, 2, result: 'success', invoice: invoice_2)

        expect(merchant.favorite_customer).to eq(cool_customer)
      end
    end

    describe "self.most_items_sold" do
      it "returns the top x merchants ranked by total quantity generated" do
        merchant_1      = create :merchant
        merchant_2      = create :merchant
        item            = create :item
        invoice_1       = create :invoice,      merchant: merchant_1
        invoice_2       = create :invoice,      merchant: merchant_2
        invoice_items_1 = create :invoice_item, invoice:  invoice_1, quantity: 1
        invoice_items_2 = create :invoice_item, invoice:  invoice_2, quantity: 10

        create(:transaction, invoice: invoice_1, result: "success")
        create(:transaction, invoice: invoice_2, result: "success")

        expect(Merchant.most_items_sold(1).first).to eq(merchant_2)
      end
    end

    describe "self.total_revenue(date)" do
      it " returns the total revenue for date x across all merchants" do
        date     = "2012-03-16 11:55:05"
        merchant = create(:merchant)
        invoices = create_list(:invoice, 5, merchant: merchant, created_at: date)

        create_transaction(invoices)

        expect(Merchant.total_revenue(date)).to eq(500)
      end
    end

    describe "self.most_revenue(x)" do
      before { setup_merchant_most_revenue_spec() }

      it "returns the top x merchants ranked by total revenue" do
        merchants = Merchant.most_revenue(2)
        merch_id  = [ merchants.first.id, merchants.second.id ]

        expect(merchants.class).to eq(Array)
        expect(merchants.length).to eq(2)
      end
    end
  end
end
