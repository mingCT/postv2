module ApplicationHelper
	def fix_url(url)
		url.starts_with?("http://") ? url : "http://#{url}"
	end

	def display_datetime(dt)
		dt.strftime("%m/%d/%Y %l:%M%P")
	end

	def fix_url(url)
	  return url if url.blank?
	  
	  if url.starts_with?('http://')
	  	return url
	  else
	  	return "http://" + url
	  end
		
	end



end
