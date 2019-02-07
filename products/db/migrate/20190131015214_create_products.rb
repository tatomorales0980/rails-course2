class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :bar_code
      t.string :description
      t.string :price
      t.integer :group_id
      t.timestamps
    end
  end
end
