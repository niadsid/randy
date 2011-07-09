xml.instruct! :xml, :version=>"1.0"

xml.tag!("tabbar") do
	xml.tag!("row") do
		xml.tab("Tab 1-1", "id" => "a1", "width" => "200px")
		xml.tab("Tab 1-2", "id" => "a2", "width" => "200px")
	end
end
