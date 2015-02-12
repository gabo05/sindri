if (Rails.env == "development")
	Dir.glob("#{Rails.root}/app/**/*.rb").each do |model_name|
		require_dependency model_name
	end
end