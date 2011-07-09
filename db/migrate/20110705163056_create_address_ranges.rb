class CreateAddressRanges < ActiveRecord::Migration
  def self.up
    create_table :address_ranges do |t|
      t.string :first_address
      t.string :last_address
      t.string :description
      t.integer :subnet_id

      t.timestamps
    end
  end

  def self.down
    drop_table :address_ranges
  end
end
