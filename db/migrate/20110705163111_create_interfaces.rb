class CreateInterfaces < ActiveRecord::Migration
  def self.up
    create_table :interfaces do |t|
      t.string :interface_name
      t.string :layer2_address
      t.string :description
      t.integer :system_id

      t.timestamps
    end
  end

  def self.down
    drop_table :interfaces
  end
end
