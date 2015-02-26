class AccountsRole < ActiveRecord::Base
	belongs_to :account
	belongs_to :role
	before_save :set_defaults
	def initialize
		super()
	end
	def initialize(account, role)
		super()
		self.account = account
		self.role = role
	end
	private
      def set_defaults
        self.state ||= 1
      end
end