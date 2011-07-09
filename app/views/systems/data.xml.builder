xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @systems.each do |system|
        xml.tag!("row",{ "id" => system.id }) do
			xml.tag!("cell", system.system_name)
            xml.tag!("cell", system.location)
            xml.tag!("cell", system.description)
        end
    end
end
