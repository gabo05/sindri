class Category < ActiveRecord::Base	
	def initialize
		super()
	end
	def initialize(data)
		super()
		self.name = data[:name]
		self.description = data[:description]
	end
end
