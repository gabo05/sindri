class BusinessesArea < ActiveRecord::Base
	belongs_to :business
	belongs_to :area
	
	def initialize(area_id, business_id)
		super()
		if area_id != nil and business_id != nil
			self.area_id = area_id
			self.business_id = business_id
		end
	end
end