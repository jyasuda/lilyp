class CreateConstructionsProducts < ActiveRecord::Migration
  def self.up
    create_table :constructions_products, :id => false do |t|
      t.integer :construction_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :constructions_products
  end
end
