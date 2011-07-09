class Subnet < ActiveRecord::Base
  attr_accessible :subnet_name, :subnet_identifier, :mask_length, :default_router, :description, :site_id
  
  belongs_to :site
  has_many :addresses
  has_many :address_ranges

  def friendly_descriptor
    self.subnet_name + ' (' + self.subnet_identifier + '/' + self.mask_length + ')'
  end
end

# == Schema Information
#
# Table name: subnets
#
#  id                :integer         not null, primary key
#  subnet_name       :string(255)
#  subnet_identifier :string(255)
#  mask_length       :string(255)
#  default_router    :string(255)
#  description       :string(255)
#  site_id           :integer
#  created_at        :datetime
#  updated_at        :datetime
#

