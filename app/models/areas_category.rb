class AreasCategory < ActiveRecord::Base
	belongs_to :businesses_area
	belongs_to :category

	def initialize(category_id = nil, business_id = nil, area_id = nil)
		super()
		if category_id != nil and business_id != nil
			if area_id == nil
				area_id = Area.where('is_default = (1)::bit(1) and state = (1)::bit(1)').first().id
				ba = BusinessesArea.new area_id, business_id
				ba.save
			end
			business_area_id = BusinessesArea.where('business_id = ? and area_id = ?', business_id, area_id).first().id
			self.businesses_area_id = business_area_id
			self.category_id = category_id
		end
	end
end