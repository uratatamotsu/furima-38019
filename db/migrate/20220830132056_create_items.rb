class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string :exhibits_name,        null: false
      t.text :exhibits_text,          null: false
      t.integer :money,               null: false
      t.integer :category_id,         null: false
      t.integer :situation_id,        null: false
      t.integer :shipping_cost_id,    null: false
      t.integer :delivery_area_id,    null: false
      t.integer :shipping_days_id,    null: false


      t.timestamps
    end
  end
end
