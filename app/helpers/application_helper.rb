module ApplicationHelper
	def current_class?(url_path)
	    return 'active' if request.path == url_path 
	    ''
  	end
end
