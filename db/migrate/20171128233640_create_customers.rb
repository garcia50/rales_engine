class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.citext :first_name
      t.citext :last_name
      t.datetime "created_at", precision: 0
      t.datetime "updated_at", precision: 0
    end
  end
end
