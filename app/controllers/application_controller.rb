class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :menu_pages, :current_path

  def menu_pages
    { 
      hunts: "/hunts",
     properties: "/properties",
     streets: "/streets"}
  end

  def current_path
    request.env["PATH_INFO"]
  end
end
