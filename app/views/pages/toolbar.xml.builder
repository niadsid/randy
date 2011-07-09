xml.instruct! :xml, :version=>"1.0"

xml.tag!("toolbar") do
	xml.item("id" => "a", "type" => "button", "text" => "Export")
	xml.item("id" => "b", "type" => "button", "text" => "Help")
end
