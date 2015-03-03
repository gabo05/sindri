class BusinessesArea < ActiveRecord::Base
	belongs_to :business
	belongs_to :area
	
	# def initialize(area_id= nil, business_id=nil)
	# 	super()
	# 	if area_id != nil
	# 		self.area_id = area_id
	# 	end
	# 	if business_id != nil
	# 		self.business_id = business_id
	# 	end
	# end
end