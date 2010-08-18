class CreateCareInstructions < ActiveRecord::Migration
  def self.up
    create_table :care_instructions do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :care_instructions
  end
end
