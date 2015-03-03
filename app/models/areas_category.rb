class AreasCategory < ActiveRecord::Base
	belongs_to :businesses_area
	belongs_to :category

	# def initialize(category_id = nil, business_id = nil, area_id = nil, businesses_area_id=nil)
	# 	super()
	# 	if businesses_area_id == nil
	# 		if area_id == nil
	# 			area_id = Area.where('is_default = (1)::bit(1) and state = (1)::bit(1)').first().id
	# 		end
	# 		businesses_area_id = BusinessesArea.where('business_id = ? and area_id = ?', business_id, area_id).first().id
	# 	end
	# 	if category_id != nil
	# 		self.category_id = category_id
	# 	end
	# 	self.businesses_area_id = business_area_id
	# end
end