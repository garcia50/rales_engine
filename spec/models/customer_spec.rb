require 'rails_helper'

RSpec.describe Customer do
  context "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  context "relationships" do
    it { should have_many(:invoices) }
    it { should have_many(:transactions) }
  end

  context "business analytics" do
    describe "#favorite_merchant" do
      it "returns a merchant where the customer the most successful transaction" do
        customer = create :customer
        merchant_1 = create :merchant
        merchant_2 = create :merchant
        invoice_1 = create :invoice, merchant: merchant_1, customer: customer
        invoice_2 = create :invoice, merchant: merchant_1, customer: customer
        invoice_3 = create :invoice, merchant: merchant_2, customer: customer

        create(:transaction, result: 'success', invoice: invoice_1)
        create(:transaction, result: 'success', invoice: invoice_2)
        create(:transaction, result: 'success', invoice: invoice_3)

        expect(customer.favorite_merchant).to eq(merchant_1)
      end
    end
  end
end
