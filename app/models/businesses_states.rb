class BusinessesState < ActiveRecord::Base
	belongs_to :business
	belongs_to :state

	def initialize
		super()
	end
	def initialize(state_id, business_id)
		super()
		self.state_id = state_id
		self.business_id = business_id
	end
end