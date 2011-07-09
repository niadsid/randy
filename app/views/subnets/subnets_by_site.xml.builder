xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @subnets.each do |subnet|
        xml.tag!("row",{ "id" => subnet.id }) do
			xml.tag!("cell", subnet.subnet_name)
            xml.tag!("cell", subnet.subnet_identifier)
			xml.tag!("cell", subnet.mask_length)
			xml.tag!("cell", subnet.default_router)
            xml.tag!("cell", subnet.description)
        end
    end
end
