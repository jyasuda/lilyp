class CreateProductsTypeOfFits < ActiveRecord::Migration
  def self.up
    create_table :products_type_of_fits, :id => false do |t|
      t.integer :category_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :products_type_of_fits
  end
end
