class State < ActiveRecord::Base
	def initialize
		super()
	end
	def initialize(data)
		super()
		self.name = data[:name]
		self.description = data[:description]
		self.css_class = data[:css_class]
		self.order = data[:css_class]
	end
end
