class BusinessesState < ActiveRecord::Base
	belongs_to :business
	belongs_to :state

	def initialize(state_id = nil, business_id = nil)
		super()
		if state_id != nil
			self.state_id = state_id
		end
		if business_id != nil
			self.business_id = business_id
		end
	end
end