class AddPurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.integer :price
      t.timestamps
    end
  end
end
