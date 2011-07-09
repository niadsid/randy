xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @domain_names.each do |domain_name|
        xml.tag!("row",{ "id" => domain_name.id }) do
			xml.tag!("cell", domain_name.fully_qualified_domain_name)
            xml.tag!("cell", domain_name.description)
        end
    end
end