class AreasCategory < ActiveRecord::Base
	belongs_to :area
	belongs_to :category
	belongs_to :business

	def initialize
		super()
	end
	def initialize(category_id, business_id, area_id = nil)
		super()
		if area_id == nil
			self.area_id = Area.where('is_default = (1)::bit(1) and state = (1)::bit(1)').first().id
		else
			self.area_id = area_id
		end
		self.category_id = category_id
		self.business_id = business_id
	end
end