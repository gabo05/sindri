module ApplicationHelper
	def upload_file_to (uploaded, dir)
		File.open(dir, 'wb') do |file|
            file.write(uploaded.read)
        end
	end
	def pagination_tag(pagination, controller, action)
		pages = content_tag(:li) do
					link_to raw("&laquo;"), controller: controller, action: action, page: 1, size: pagination.size
				end
		page = 1 
		no_pages = pagination.no_pages
        until page > no_pages
			pages << content_tag(:li) do
				link_to page, controller: controller, action: action, page: page, size: pagination.size
			end
			page+=1
		end
		pages << content_tag(:li) do
					link_to raw("&raquo;"), controller: controller, action: action, page: no_pages, size: pagination.size
				end
		content_tag(:nav) do
			content_tag(:ul, :class => "pagination") do
				pages
			end
		end
	end
	def date_picker_tag(name, value)
		content = text_field_tag name, value, class: 'form-control'
		content << content_tag(:span, content_tag(:span, nil, class: 'glyphicon glyphicon-calendar'), class: 'input-group-addon')

		content_tag(:div, content, class: 'input-group date', id: "dtp_#{name}")
	end
end
