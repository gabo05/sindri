module HomeHelper
	def switch_business(id)
		user = YAML.load(session[:user])
		if user.type == 'agent'
      		business = Business.where('id = ? and state = (1)::bit(1)', id).first
      		user.business_id = business.id
      		user.business_name = business.name
      		session[:user] = user.to_yaml
      	end
	end
end
