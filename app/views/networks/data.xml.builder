xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @networks.each do |network|
        xml.tag!("row",{ "id" => network.id }) do
			xml.tag!("cell", network.network_name)
            xml.tag!("cell", network.description)
        end
    end
end