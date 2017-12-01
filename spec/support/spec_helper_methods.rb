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

    def configure_customers_with_pending_invoices
      merchant = create(:merchant)
      customer_1, customer_2, customer_3 = create_list(:customer, 3)
      invoice_1 = create(:invoice, customer: customer_1, merchant: merchant)
      invoice_2 = create(:invoice, customer: customer_2, merchant: merchant)
      invoice_3 = create(:invoice, customer: customer_3, merchant: merchant)
      invoice_1.transactions << create_list(:transaction, 5, result: 'failed')
      invoice_2.transactions << create_list(:transaction, 5, result: 'success')
      invoice_3.transactions << create_list(:transaction, 5, result: 'failed')
    end
  end
end