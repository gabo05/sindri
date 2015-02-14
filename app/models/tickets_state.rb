class TicketsState < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :state
	before_save :set_defaults
	private
	  def set_defaults
	  	self.state ||= 1
	  	self.is_current = 1
	  	TicketsState.where('ticket_id = ?', self.ticket_id).update_all(:is_current => 0)
	  end
end