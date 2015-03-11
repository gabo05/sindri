class SchedulesAgent < ActiveRecord::Base
	belongs_to :agent
	belongs_to :schedule
	before_save :set_defaults

	private
		def set_defaults
			self.state ||= 1
		end
end