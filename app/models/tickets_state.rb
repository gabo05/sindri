class TicketsState < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :state
	belongs_to :agent, foreign_key: "change_by"
	before_save :set_defaults

	def initialize
		super()
	end

	def initialize(ticket_id, state_id, change_by)
		super()
		self.ticket_id = ticket_id
		self.state_id = state_id
		self.change_by = change_by
		self.is_current = 1
	end

	private
	  def set_defaults
	  	self.state ||= 1
	  	self.is_current = 1
	  	TicketsState.where('ticket_id = ?', self.ticket_id).update_all(:is_current => 0)
	  end
end