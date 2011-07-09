class DomainName < ActiveRecord::Base
  attr_accessible :fully_qualified_domain_name, :description 
  
  has_many :domain_mappings
  has_many :addresses, :through => :domain_mappings
end

# == Schema Information
#
# Table name: domain_names
#
#  id                          :integer         not null, primary key
#  fully_qualified_domain_name :string(255)
#  description                 :string(255)
#  created_at                  :datetime
#  updated_at                  :datetime
#

