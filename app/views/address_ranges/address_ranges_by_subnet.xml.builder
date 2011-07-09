xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @address_ranges.each do |address_range|
        xml.tag!("row",{ "id" => address_range.id }) do
			xml.tag!("cell", address_range.first_address)
            xml.tag!("cell", address_range.last_address)
            xml.tag!("cell", address_range.description)
        end
    end
end
