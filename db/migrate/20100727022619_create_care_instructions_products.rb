class CreateCareInstructionsProducts < ActiveRecord::Migration
  def self.up
    create_table :care_instructions_products, :id => false do |t|
      t.integer :care_instruction_id
      t.integer :product_id
    end
  end

  def self.down
    drop_table :care_instructions_products
  end
end
