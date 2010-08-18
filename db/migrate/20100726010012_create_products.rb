class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.text :description
      t.date :startDate
      t.string :size_id
      t.integer :style_id
      t.integer :primaryCategory_id
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
