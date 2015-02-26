class Area < ActiveRecord::Base
	def initialize
		super()
	end
	def initialize(data)
		super()
		self.name = data[:name]
		self.description = data[:description]
	end
	def area
		agents_id = AgentsArea.where('area_id = ? and state = (1)::bit(1)', self.id).collect{ |aa| aa.agent_id }
		agents = Agent.where('id in (?)', agents_id)
		return agents
	end
end