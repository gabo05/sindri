class TicketsResponse < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :account
	before_save :set_defaults
	private
	  def set_defaults
	  	self.state ||= 1
	  end
end