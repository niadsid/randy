# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110705163142) do

  create_table "address_ranges", :force => true do |t|
    t.string   "first_address"
    t.string   "last_address"
    t.string   "description"
    t.integer  "subnet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.string   "network_address"
    t.integer  "mask_length"
    t.string   "description"
    t.boolean  "virtual_ip"
    t.integer  "subnet_id"
    t.integer  "interface_id"
    t.integer  "nat_address_id"
    t.integer  "address_range_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain_mappings", :force => true do |t|
    t.integer  "domain_name_id"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain_names", :force => true do |t|
    t.string   "fully_qualified_domain_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interfaces", :force => true do |t|
    t.string   "interface_name"
    t.string   "layer2_address"
    t.string   "description"
    t.integer  "system_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "networks", :force => true do |t|
    t.string   "network_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "site_name"
    t.integer  "network_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subnets", :force => true do |t|
    t.string   "subnet_name"
    t.string   "subnet_identifier"
    t.string   "mask_length"
    t.string   "default_router"
    t.string   "description"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", :force => true do |t|
    t.string   "system_name"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
