class ActiveUser
	attr_reader :id
	attr_reader :type
	attr_reader :full_name
	attr_reader :user_id
	attr_reader :business_id
	attr_reader :business_name
	attr_reader :roles

	def initialize(id, user, business, roles)
		@id = id
		@type = user.type
		@full_name = user.full_name
		@user_id = user.id
		@business_id = business.id
		@business_name = business.name
		@roles = roles
	end
	def is_in_role?(role)
		role_rol = Role.where('key_name = ? and id = ?', role, self.roles).first
		return role_rol != nil
	end
end