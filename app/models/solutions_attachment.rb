class SolutionsAttachment < ActiveRecord::Base
	belongs_to :attachment
	belongs_to :solution
	before_save :set_defaults

	private
		def set_defaults
			self.state ||= 1
		end
end