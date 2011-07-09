class Interface < ActiveRecord::Base
  attr_accessible :interface_name, :layer2_address, :description, :system_id
  
  belongs_to :system
  has_many :addresses
end

# == Schema Information
#
# Table name: interfaces
#
#  id             :integer         not null, primary key
#  interface_name :string(255)
#  layer2_address :string(255)
#  description    :string(255)
#  system_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

