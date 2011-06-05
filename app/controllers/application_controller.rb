class ApplicationController < ActionController::Base
  protect_from_forgery


  def current_tab(section, title = "")
    @current_tab    = section
    @current_title  = title
  end
  
  
end
