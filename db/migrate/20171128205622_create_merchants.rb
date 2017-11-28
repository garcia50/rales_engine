class CreateMerchants < ActiveRecord::Migration[5.1]
  def change
    create_table :merchants do |t|
      t.citext :name
      t.datetime "created_at", precision: 0
      t.datetime "updated_at", precision: 0
    end
  end
end
