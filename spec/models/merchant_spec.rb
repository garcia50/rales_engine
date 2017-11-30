require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context "validations" do
    it {should validate_presence_of(:name)}
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
        invoice_2     = create :invoice, merchant: merchant, customer: cool_customer
        invoice_3     = create :invoice, merchant: merchant, customer: weak_customer

        create_list(:transaction, 4, result: 'success', invoice: invoice_1)
        create_list(:transaction, 2, result: 'success', invoice: invoice_3)

        expect(merchant.favorite_customer).to eq(cool_customer)
      end
    end
  end
end