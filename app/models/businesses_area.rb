class BusinessesArea < ActiveRecord::Base
	belongs_to :business
	belongs_to :area
	def initialize
		super()
	end
	def initialize(area_id, business_id)
		super()
		self.area_id = area_id
		self.business_id = business_id
	end
end