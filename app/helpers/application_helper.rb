module ApplicationHelper
  
  def title
    base_title = "hey there"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
  
  def test

  end
end
