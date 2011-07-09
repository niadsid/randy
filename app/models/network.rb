class Network < ActiveRecord::Base
  attr_accessible :network_name, :description
  
  has_many :sites
  
  # Produces a formatted list of a network's sites
  def member_sites
    member_sites = Array.new
    self.sites.each do |i|
      member_sites.push(i.site_name)
    end
    member_sites.join("<br>")
  end
end

# == Schema Information
#
# Table name: networks
#
#  id           :integer         not null, primary key
#  network_name :string(255)
#  description  :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

