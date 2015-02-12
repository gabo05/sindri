class AccountsRole < ActiveRecord::Base
	belongs_to :account
	belongs_to :role
	before_save :set_defaults
	private
      def set_defaults
        self.state ||= 1
      end
end