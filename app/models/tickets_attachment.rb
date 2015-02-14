class TicketsAttachment < ActiveRecord::Base
	belongs_to :ticket
	belongs_to :attachment
	before_save :set_defaults
	private
	  def set_defaults
	  	self.state ||= 1
	  end
end