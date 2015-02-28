class BusinessesAgent < ActiveRecord::Base
	belongs_to :agent
	belongs_to :business
	before_save :set_defaults

	def initialize business_id = nil, agent_id = nil
		super()
		if business_id != nil and agent_id != nil
			self.business_id = business_id
			self.agent_id = agent_id
		end
	end
	private
      def set_defaults
        self.state ||= 1
      end
end