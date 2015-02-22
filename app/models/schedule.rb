class Schedule < ActiveRecord::Base
	before_save :set_defaults

	private
		def set_defaults
			self.state ||= 1
		end
end
