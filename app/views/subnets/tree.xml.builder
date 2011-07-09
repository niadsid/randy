xml.instruct! :xml, :version=>"1.0"

xml.tree("id" => "0") do
	xml.item("text" => "All Subnets", "id" => "All Subnets", "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => "one") do
		@networks.each do |network|
			xml.item("text" => network.network_name, "id" => network.id.to_s, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => network.network_name) do
				network.sites.each do |site|
					xml.item("text" => site.site_name, "id" => network.id.to_s + " " + site.id.to_s, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => site.site_name)
				end
			end
		end
	end
end
