class BusinessController < ApplicationController

	include ApplicationHelper
    def index
        
        user = YAML.load(session[:user])
        
        all_businesses = Agent.businesses user.id

        @pagination = Pagination.new params[:page], params[:size], all_businesses
        
        @businesses = @pagination.get_records

    end
  	def create
	  	business = Business.new(params[:business])
		if business.save
			business_agent = BusinessesAgent.new
			business_agent.business = business
		  	if(request.xhr?)
		  		business_agent.agent_id = session[:new_agent_id]
		  		session[:new_agent_id] = nil
		  		business_agent.save
		  		render :json => { :status => 'OK', :id => business.id, :name=>business.name }
		  	else
		  		if params[:picture] != nil
			        uploaded_io = params[:picture]
			        upload_file_to(uploaded_io, Rails.root.join('public', 'logos', uploaded_io.original_filename))
			        business.logo = uploaded_io.original_filename
			    end
			    user = YAML.load(session[:user])
				business_agent.agent_id = user.id
				business_agent.save
				redirect_to url_for controller: "business", action: "index"
		  	end
		end
	end
	def edit
		@business = Business.where('id = ? and state = true', params[:id]).first
		@agents = Agent.all
	end
	def save
		business = Business.where('id = ? and state = true', params[:id]).first
		business.name = params[:business][:name]
		
		if params[:picture] != nil
	        uploaded_io = params[:business][:picture]
	        upload_file_to(uploaded_io, Rails.root.join('public', 'logos', uploaded_io.original_filename))
	        business.logo = uploaded_io.original_filename
	    end

	    business.color1 = params[:business][:color1]
	    business.color2 = params[:business][:color2]
	    business.save
	    
	    redirect_to url_for controller: "business", action: "edit", id: params[:id]
	end
	def add_agent
		business_agent = BusinessesAgent.new
		business_agent.agent_id = params[:agent_id]
		business_agent.business_id = params[:business_id]
		business_agent.save

		redirect_to url_for controller: "business", action: "edit", id: params[:business_id]
	end
	def remove_agent
		business_agent = BusinessesAgent.where('agent_id = ? and business_id = ? and state = (1)::bit(1)', params[:agent_id], params[:business_id]).first
		business_agent.state = 0
		business_agent.save
		redirect_to url_for controller: "business", action: "edit", id: params[:business_id]
	end
end
