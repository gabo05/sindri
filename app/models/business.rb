class Business < ActiveRecord::Base
	
	has_many :businesses_agent
	before_save :set_defaults

	def agents
		agents_id = BusinessesAgent.where('business_id = ?', id).collect{ |ba| ba.agent_id }

        agents = Agent.where('id in (?)', agents_id)

        return agents
	end
	private
      def set_defaults
        self.state ||= 1
      end
end
