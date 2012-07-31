module ApplicationHelper
	def get_current_host_and_port
		request.protocol+request.host_with_port+"/"
	end
end
