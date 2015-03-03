class TicketsState < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :state
	belongs_to :agent
	belongs_to :client
	before_save :set_defaults

	def initialize(ticket_id = nil, state_id = nil, change_by=nil, client_id = nil)
		super()
		if ticket_id != nil and state_id != nil
			self.ticket_id = ticket_id
			self.state_id = state_id
			self.agent_id = change_by
			self.client_id = client_id
		end
		self.is_current = 1
	end

	private
	  def set_defaults
	  	# self.state ||= 1
	  	# self.is_current = 1
	  	TicketsState.where('ticket_id = ?', self.ticket_id).update_all(:is_current => 0)
	  end
end