class CatalogController < ApplicationController
	def areas
		user = YAML.load(session[:user])
		all_areas = Business.areas(user.business_id)
		
		if(params[:id] != nil)
			@area = all_areas.where('id = ?', params[:id])
		else
	        @pagination = Pagination.new params[:page], params[:size], all_areas
	        @areas = @pagination.get_records
	    end
	end

	def categories
		user = YAML.load(session[:user])
		all_categories = Business.categories(user.business_id)
		
		if(params[:id] != nil)
			@category = all_categories.where('id = ?', params[:id])
		else
			@areas = Business.areas(user.business_id)
	        @pagination = Pagination.new params[:page], params[:size], all_categories
	        @categories = @pagination.get_records
	    end
	end
	
	def states
		user = YAML.load(session[:user])
		all_states = Business.states(user.business_id)
		
		if(params[:id] != nil)
			@state = all_states.where('id = ?', params[:id])
		else
	        @pagination = Pagination.new params[:page], params[:size], all_states
	        @states = @pagination.get_records
	    end
	end

	def add_areas
		areas_id = params[:areas_id].split('_')
		business_id = params[:business_id]
		business_areas = []
		for area_id in areas_id
			business_areas.push({:area_id => area_id, :business_id => business_id})
		end
		BusinessesArea.create business_areas
		area_default = Area.where('is_default = (1)::bit(1) and state = (1)::bit(1)').first.id

		business_area_default = BusinessesArea.new business_id: business_id, area_id: area_default
		business_area_default.save
		render :json => { :status=> 'OK', :id => business_id }
	end

	def add_categories
		categories_id = params[:categories_id].split('_')
		business_id = params[:business_id]
		business_categories = []
		area_default = Area.where('is_default = (1)::bit(1) and state = (1)::bit(1)').first.id
		area_business = BusinessesArea.where('business_id = ? and area_id = ?', business_id, area_default).first
		for category_id in categories_id
			business_categories.push({ :category_id => category_id, :businesses_area_id => area_business.id })
		end
		AreasCategory.create(business_categories)

		render :json => { :status=> 'OK', :id => business_id }
	end

	def add_states
		business_id = params[:business_id]

		if params[:suggested] == 'suggested'
			states_id = params[:states_id].split('_')
			business_states = []
			for state_id in states_id
				business_states.push({ :state_id => state_id, :business_id => business_id })
			end
			business_state = BusinessesState.create business_states

		elsif params[:suggested] == 'custom'
			state = State.new(name: params[:name], description: params[:description], color: params[:color], order: 1)
			state.save
			business_state = BusinessesState.new state.id, business_id
			business_state.save
		end
		render :json => { :status=> 'OK', :id => business_id }
	end

	def create_area
		user = YAML.load(session[:user])
		area = Area.new(params[:area])
		area.save
		business_area = BusinessesArea.new(business_id: user.business_id, area_id: area.id)
		business_area.save
		redirect_to url_for controller: "catalog", action: "areas", page: 1
	end

	def create_category
		category = Category.new(params[:category])
		category.save
		redirect_to url_for controller: "catalog", action: "categories", page: 1
	end

	def create_state
		user = YAML.load(session[:user])
		
		state = State.new(params[:state])
		state.save

		business_state = BusinessesState.new state.id, user.business_id
		business_state.save

		redirect_to url_for controller: "catalog", action: "states", page: 1
	end

	def delete_area
	end
	def delete_category
	end
	def delete_state
	end
end
