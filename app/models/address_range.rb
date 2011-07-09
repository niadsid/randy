class AddressRange < ActiveRecord::Base
  attr_accessible :first_address, :last_address, :description, :subnet_id
  
  belongs_to :subnet
  has_many :addresses
end

# == Schema Information
#
# Table name: address_ranges
#
#  id            :integer         not null, primary key
#  first_address :string(255)
#  last_address  :string(255)
#  description   :string(255)
#  subnet_id     :integer
#  created_at    :datetime
#  updated_at    :datetime
#

