xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @addresses.each do |address|
        xml.tag!("row",{ "id" => address.id }) do
			xml.tag!("cell", address.subnet.site.network.network_name)
			xml.tag!("cell", address.subnet.site.site_name)
			xml.tag!("cell", address.subnet.subnet_name)
			xml.tag!("cell", address.network_address)
            xml.tag!("cell", address.mask_length)
			xml.tag!("cell", address.interface.system.system_name)
            xml.tag!("cell", address.description)
        end
    end
end
