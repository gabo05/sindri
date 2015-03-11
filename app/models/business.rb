class Business < ActiveRecord::Base
	
	has_many :businesses_agent
	before_save :set_defaults

	def initialize(data = nil)
		super()
		if data != nil
			self.name = data[:name]
			self.color1 = data[:color1]
			self.color2 = data[:color2]
		end
	end
	def self.agents id
		agents_id = BusinessesAgent.where('business_id = ?', id).collect{ |ba| ba.agent_id }

        agents = Agent.where('id in (?)', agents_id)

        return agents
	end
	def agents
		return Business.agents(self.id)
	end
	def self.administrator id
		
		query = "select * from fnGetBusinessAdministrator(#{id})"
		
		agent = Agent.connection.execute(query, :skip_logging)

		return agent
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
	#Areas
	def self.areas id
		areas_id = BusinessesArea.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.area_id }
		areas = Area.where('id in (?) and state = (1)::bit(1)', areas_id)
		return areas
	end
	def areas
		return Business.areas(self.id)
	end
	#States
	def self.states id
		states_id = BusinessesState.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.state_id }
		states = State.where('id in (?) and state = (1)::bit(1)', states_id)
		return states
	end
	def states
		return Business.states(self.id)
	end
	#Categories
	def self.categories id
		ba_id = BusinessesArea.where('state = (1)::bit(1) and business_id = ?', id).collect{ |a| a.id }
		categories_id = AreasCategory.where('state = (1)::bit(1) and businesses_area_id in (?)', ba_id).collect{ |ac| ac.category_id }
		categories = Category.where('id in (?) and state = (1)::bit(1)', categories_id)
		return categories
	end
	def categories
		return Business.categories(self.id)
	end
	private
      def set_defaults
        self.state ||= 1
      end
end
