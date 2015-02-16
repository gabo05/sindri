class Business < ActiveRecord::Base
	
	has_many :businesses_agent
	before_save :set_defaults

	def self.agents id
		agents_id = BusinessesAgent.where('business_id = ?', id).collect{ |ba| ba.agent_id }

        agents = Agent.where('id in (?)', agents_id)

        return agents
	end
	def agents
		return Business.agents(self.id)
	end
	def self.clients id
		return Client.where('business_id = ? and state = (1)::bit(1)', id)
	end
	def clients
		return Business.clients(self.id)
	end
	def belongs?(agent_id)
		business_agent = BusinessesAgent.where('agent_id = ? and business_id = ? and state = (1)::bit(1)', agent_id, self.id)
		return business_agent.count > 0
	end
	private
      def set_defaults
        self.state ||= 1
      end
end
