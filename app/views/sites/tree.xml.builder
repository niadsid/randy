xml.instruct! :xml, :version=>"1.0"

xml.tree("id" => "0") do
	xml.item("text" => "All Sites", "id" => "All Sites", "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => "one") do
		@networks.each do |network|
			xml.item("text" => network.network_name, "id" => network.id.to_s, "im0" => "folderClosed.gif", "im1" => "folderOpen.gif", "im2" => "folderClosed.gif", "tooltip" => network.network_name)
		end
	end
end
