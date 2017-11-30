module SpecHelperMethods
  def create_transaction(invoices)
    invoices.each do |inv|
      create(:transaction,  invoice: inv, result: 'success')
      create(:invoice_item, invoice: inv, unit_price: 10, quantity: 10)
    end

    def setup_merchant_most_revenue_spec
      merchant_1, merchant_2 = create_list(:merchant, 2)

      item_1    = create(:item,    merchant: merchant_1)
      item_2    = create(:item,    merchant: merchant_2)
      invoice_1 = create(:invoice, merchant: merchant_1)
      invoice_2 = create(:invoice, merchant: merchant_2)

      create(:invoice_item, invoice: invoice_1, item: item_1, quantity: 350, unit_price: 350)
      create(:invoice_item, invoice: invoice_2, item: item_2, quantity: 11,  unit_price: 11)

      create(:transaction, invoice: invoice_1, result: "success")
      create(:transaction, invoice: invoice_2, result: "success")
    end
  end
end