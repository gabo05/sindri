module ApplicationHelper
	def upload_file_to (uploaded, dir)
		File.open(dir, 'wb') do |file|
            file.write(uploaded.read)
        end
	end
end
