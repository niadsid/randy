class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :networks do |t|
      t.string :network_name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
