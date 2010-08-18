class CreateGroupingsProducts < ActiveRecord::Migration
  def self.up
    create_table :groupings_products, :id => false do |t|
      t.integer :grouping_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :groupings_products
  end
end
