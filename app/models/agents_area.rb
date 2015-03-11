class AgentsArea < ActiveRecord::Base
	belongs_to :area
	belongs_to :agent

	def initialize (agent_id = nil, area_id = nil)
		super()
		if agent_id != nil and area_id != nil
			self.agent_id = agent_id
			self.area_id = area_id
		end
	end
end