class AddPreciseTimeStampsToInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :created_at, :datetime, precision: 0
    add_column :invoices, :updated_at, :datetime, precision: 0
  end
end
