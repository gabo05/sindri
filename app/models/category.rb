class Category < ActiveRecord::Base
	def self.categories_for(business_id)
		category_ids = BusinessesCategory.where('state = (1)::bit(1) and business_id = ?', business_id).collect { |bc| bc.category_id }
		return Category.where('id in (?)', category_ids)
	end
end
