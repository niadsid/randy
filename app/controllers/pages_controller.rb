class PagesController < ApplicationController
  def home
    @title = "Home"
  end
  
  def tabbar
  end
  
  def tabs
    @title = "Tabs"
    @test  = "test"

  end
  
  def toolbar
  end
end
