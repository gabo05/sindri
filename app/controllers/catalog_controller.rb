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
		for area_id in areas_id
			business_area = BusinessesArea.new(area_id, business_id)
			business_area.save
		end
		render :json => { :status=> 'OK', :id => business_id }
	end

	def add_categories
		categories_id = params[:categories_id].split('_')
		business_id = params[:business_id]
		for category_id in categories_id
			business_category = AreasCategory.new(category_id, business_id)
			business_category.save
		end
		render :json => { :status=> 'OK', :id => business_id }
	end

	def add_states
		states_id = params[:states_id].split('_')
		business_id = params[:business_id]
		for state_id in states_id
			business_state = BusinessesState.new(state_id, business_id)
			business_state.save
		end
		render :json => { :status=> 'OK', :id => business_id }
	end

	def create_area
		area = Area.new(params[:area])
		area.save
		redirect_to url_for controller: "catalog", action: "areas"
	end

	def create_category
		category = Category.new(params[:category])
		category.save
		redirect_to url_for controller: "catalog", action: "categories"
	end

	def create_state
		state = State.new(params[:state])
		state.save
		redirect_to url_for controller: "catalog", action: "states"
	end

	def delete_area
	end
	def delete_category
	end
	def delete_state
	end
end
