class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.citext  :name
      t.citext  :description
      t.integer :unit_price

      t.datetime "created_at", precision: 0
      t.datetime "updated_at", precision: 0
    end
  end
end
