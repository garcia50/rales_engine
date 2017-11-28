class CreateInvoiceItems < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_items do |t|
      t.references :invoice
      t.references :item
      t.integer    :quantity
      t.integer    :unit_price

      t.datetime "created_at", precision: 0
      t.datetime "updated_at", precision: 0
    end
  end
end
