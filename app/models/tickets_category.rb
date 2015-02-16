class TicketsCategory < ActiveRecord::Base
	belongs_to :category
	belongs_to :ticket
	before_save :set_defaults

	private
		def set_defaults
			state ||= 1
		end
end