class ActiveUser
	protected
		attr_writer :business_id
		attr_writer :business_name
		attr_writer :business_logo
	public
		attr_reader :id
		attr_reader :type
		attr_reader :full_name
		attr_reader :user_id
		attr_reader :business_id
		attr_reader :business_name
		attr_reader :roles
		attr_reader :business_logo

		def initialize(id, user, business, roles)
			@id = id
			@type = user.type
			@full_name = user.full_name
			@user_id = user.id
			if(business != nil)
				self.business_id = business.id
				self.business_name = business.name
				self.business_logo = business.logo
			end
			@roles = roles
		end
		def business=(business)
			self.business_id = business.id
			self.business_name = business.name
			self.business_logo = business.logo
		end
		def is_in_role?(role)
			role_rol = Role.where('key_name = ? and id = ?', role, self.roles).first
			return role_rol != nil
		end
end