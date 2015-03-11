class TicketsCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :ticket
	before_save :set_defaults

	def initialize
		super()
	end
	def initialize(ticket_id, category_id)
		super()
		self.ticket_id = ticket_id
		self.category_id = category_id
	end
	private
		def set_defaults
			state ||= 1
		end
end