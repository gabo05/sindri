class Category < ActiveRecord::Base	
	
	def initialize(data)
		super()
		if data != nil
			self.name = data[:name]
			self.description = data[:description]
		end
	end
end
