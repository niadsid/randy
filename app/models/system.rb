class System < ActiveRecord::Base
  attr_accessible :system_name, :location, :description 
    
  has_many :interfaces
  
  # Produces a formatted list of a system's interfaces
  def associated_interfaces
    associated_interfaces = Array.new
    self.interfaces.each do |i|
      associated_interfaces.push(i.interface_name)
    end
    associated_interfaces.join("<br>")
  end 
  
end

# == Schema Information
#
# Table name: systems
#
#  id          :integer         not null, primary key
#  system_name :string(255)
#  location    :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

