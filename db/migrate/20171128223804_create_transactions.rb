class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :credit_card_number
      t.datetime :credit_card_expiration_date
      t.citext :result

      t.datetime "created_at", precision: 0
      t.datetime "updated_at", precision: 0
    end
  end
end
