module ApplicationHelper
	def upload_file_to (uploaded, dir)
		File.open(dir, 'wb') do |file|
            file.write(uploaded.read)
        end
	end
	def pagination_tag(pagination, controller, action)
		pages = content_tag(:li) do
					link_to raw("&laquo;"), controller: controller, action: action, page: 1
				end
		page = 1 
		no_pages = pagination.no_pages
        until page > no_pages
			pages << content_tag(:li) do
				link_to page, controller: controller, action: action, page: page
			end
			page+=1
		end
		pages << content_tag(:li) do
					link_to raw("&raquo;"), controller: controller, action: action, page: no_pages
				end
		content_tag(:nav) do
			content_tag(:ul, :class => "pagination") do
				pages
			end
		end
	end
end
