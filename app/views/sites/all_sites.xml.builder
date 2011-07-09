xml.instruct! :xml, :version=>"1.0"

xml.tag!("rows") do
    @sites.each do |site|
        xml.tag!("row",{ "id" => site.id }) do
			xml.tag!("cell", site.network.network_name)
			xml.tag!("cell", site.site_name)
            xml.tag!("cell", site.description)
        end
    end
end
