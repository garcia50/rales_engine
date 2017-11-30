module SpecHelperMethods
  def create_transaction(invoices)
    invoices.each do |inv|
      create(:transaction,  invoice: inv, result: 'success')
      create(:invoice_item, invoice: inv, unit_price: 10, quantity: 10)
    end
  end
end