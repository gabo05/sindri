class TicketsAgent < ActiveRecord::Base
	belongs_to :agent
	belongs_to :ticket
	before_save :set_defaults

	def initialize
		super()
	end
	def initialize(ticket_id, agent_id)
		super()
		self.ticket_id = ticket_id
		self.agent_id = agent_id
	end
	private
	  def set_defaults
	  	self.state ||= 1
	  end
end