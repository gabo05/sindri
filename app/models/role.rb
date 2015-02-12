class Role < ActiveRecord::Base
	has_many :accounts_role
	before_save :set_defaults
	private
      def set_defaults
        self.state ||= 1
      end
end
