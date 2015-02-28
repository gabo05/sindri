class AccountsRole < ActiveRecord::Base
	belongs_to :account
	belongs_to :role
	before_save :set_defaults
	
	def initialize(account = nil, role = nil)
		super()
		if account != nil and role != nil
			self.account = account
			self.role = role
		end
	end
	private
      def set_defaults
        self.state ||= 1
      end
end