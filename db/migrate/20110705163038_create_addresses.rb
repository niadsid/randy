class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :network_address
      t.integer :mask_length
      t.string :description
      t.boolean :virtual_ip
      t.integer :subnet_id
      t.integer :interface_id
      t.integer :nat_address_id
      t.integer :address_range_id

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
