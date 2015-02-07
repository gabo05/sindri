class TicketsAgent < ActiveRecord::Base
	belongs_to :agent
	belongs_to :ticket
end