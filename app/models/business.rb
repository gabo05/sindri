class Business < ActiveRecord::Base
	
	has_many :businesses_agent
	before_save :set_defaults

	def initialize
		super()
	end
	def initialize(data)
		super()
		self.name = data[:name]
		self.color1 = data[:color1]
		self.color2 = data[:color2]
	end
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

	#Catalogs
	def self.areas id
		areas_id = BusinessesArea.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.area_id }
		areas = Area.where('id in (?) and state = (1)::bit(1)', areas_id)
		return areas
	end
	def areas
		return Business.areas(self.id)
	end
	def self.states id
		states_id = BusinessesState.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.state_id }
		states = State.where('id in (?) and state = (1)::bit(1)', states_id)
		return states
	end
	def states
		return Business.states(self.id)
	end
	def self.categories id
		categories_id = AreasCategory.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.category_id }
		categories = Category.where('id in (?) and state = (1)::bit(1)', categories_id)
		return categories
	end
	def states
		return Business.states(self.id)
	end
	private
      def set_defaults
        self.state ||= 1
      end
end
