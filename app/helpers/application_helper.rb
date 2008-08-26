# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def setup_navigation
    tabs = ['Home','About','Projects']
    nav_hash = {}
    tabs.each do |tab|
      nav_hash[tab] = 'inactive-nav'
    end
		case params[:controller]
	 	when 'pages'
			nav_hash[params[:name]] = 'active-nav'
		when 'projects'
			nav_hash['Projects'] = 'active-nav'
		end
    return nav_hash
  end
  
end
