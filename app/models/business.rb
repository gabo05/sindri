class Business < ActiveRecord::Base
	has_many :businesses_agent
	before_save :set_defaults
	private
      def set_defaults
        self.state ||= 1
      end
end
