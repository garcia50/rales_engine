class RemoveTimeStampsFromInvoices < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :created_at
    remove_column :invoices, :updated_at
  end
end
