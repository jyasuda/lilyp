class CreateTypeOfFits < ActiveRecord::Migration
  def self.up
    create_table :type_of_fits do |t|
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :type_of_fits
  end
end
