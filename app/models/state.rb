class State < ActiveRecord::Base
	def initialize
		super()
	end
	def initialize(data = nil, name = nil, description = nil, color = nil, order = nil)
		super()
		if data != nil
			self.name = data[:name]
			self.description = data[:description]
			self.color = data[:color]
			self.order = data[:order]
		end
		if name != nil
			self.name = name
		end
		if description != nil
			self.description = description
		end
		if color != nil
			self.color = color
		else
			self.color = '#777'
		end
		if order != nil
			self.order = order
		end
	end
end
