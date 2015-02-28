class ReportController < ApplicationController
  include ReportHelper
  def index
  end
  def tickets_agents
    if request.xhr?
      	sql = "SELECT * FROM tickets as t inner join tickets_agents as ta on t.id = ta.ticket_id where ta.agent_id = #{params[:id]}"
        render :json => get_result sql
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
  
  def tickets_clients
    if request.xhr?
    	sql = "SELECT * FROM tickets as t where t.client_id = #{params[:id]}"
      render :json => get_result sql
    end
    user = YAML.load(session[:user])
    @clients = Business.clients user.business_id
  end

  def tickets_categories
    if request.xhr?
    	sql = "SELECT * FROM tickets as t inner join tickets_categories as tc on t.id = tc.ticket_id where tc.category_id = #{params[:id]}"
      render :json => get_result sql
    end
    user = YAML.load(session[:user])
    @categories = Business.categories user.business_id
  end

  def tickets_states
    if request.xhr?
    	sql = "SELECT * FROM tickets as t inner join tickets_states as tc on t.id = tc.ticket_id where tc.state_id = #{params[:id]}"
      render :json => get_result sql
    end
    user = YAML.load(session[:user])
    @states = Business.states user.business_id
  end

end
