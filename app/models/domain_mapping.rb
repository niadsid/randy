class DomainMapping < ActiveRecord::Base
  attr_accessible :domain_name_id, :address_id
  
  belongs_to :address
  belongs_to :domain_name
end

# == Schema Information
#
# Table name: domain_mappings
#
#  id             :integer         not null, primary key
#  domain_name_id :integer
#  address_id     :integer
#  created_at     :datetime
#  updated_at     :datetime
#

