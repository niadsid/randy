class CreateDomainMappings < ActiveRecord::Migration
  def self.up
    create_table :domain_mappings do |t|
      t.integer :domain_name_id
      t.integer :address_id

      t.timestamps
    end
  end

  def self.down
    drop_table :domain_mappings
  end
end
