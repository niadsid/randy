class Address < ActiveRecord::Base
  attr_accessible :network_address, :mask_length, :description, :virtual_ip, :subnet_id, :interface_id, :nat_address_id, :address_range_id 
  
  belongs_to :subnet
  belongs_to :interface
  belongs_to :address_range
  has_many :domain_mappings
  has_many :domains_names, :through => :domain_mappings
  has_one :nat_address, :class_name => "Address", :foreign_key => "nat_address_id"
  belongs_to :nat_address, :class_name => "Address"
   
  # Produces a formatted list of an addresses fully-qualified-domain names
  def fqdn
    fqdn = Array.new
    self.domain_mappings.each do |i|
      fqdn.push(i.domain_name.fully_qualified_domain_name)
    end
    fqdn.join("<br>")
  end

  def friendly_descriptor
    self.network_address + "/" + self.mask_length.to_s + " (" + self.interface.system.system_name + ")"
  end

end

# == Schema Information
#
# Table name: addresses
#
#  id               :integer         not null, primary key
#  network_address  :string(255)
#  mask_length      :integer
#  description      :string(255)
#  virtual_ip       :boolean
#  subnet_id        :integer
#  interface_id     :integer
#  nat_address_id   :integer
#  address_range_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

