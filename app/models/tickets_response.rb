class TicketsResponse < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :account
	before_save :set_defaults
	def initialize
		super()
	end
	def initialize(ticket_id, account_id, text)
		super()
		self.account_id = account_id
		self.ticket_id = ticket_id
		self.text = text
	end
	def initialize(data)
		super()
		self.account_id = data[:account_id]
		self.ticket_id = data[:ticket_id]
		self.text = data[:text]
	end
	private
	  def set_defaults
	  	self.state ||= 1
	  end
end