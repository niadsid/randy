class CreateDomainNames < ActiveRecord::Migration
  def self.up
    create_table :domain_names do |t|
      t.string :fully_qualified_domain_name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :domain_names
  end
end
