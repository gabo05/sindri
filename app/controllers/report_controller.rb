class ReportController < ApplicationController
  include ReportHelper
  def index
  end
  def tickets_agents
  	sql = "SELECT * FROM tickets as t inner join tickets_agents as ta on t.id = ta.ticket_id where ta.agent_id = #{params[:id]}"
  end
  
  def tickets_clients
  	sql = "SELECT * FROM tickets as t where t.client_id = #{params[:id]}"
  end

  def tickets_categories
  	sql = "SELECT * FROM tickets as t inner join tickets_categories as tc on t.id = tc.ticket_id where tc.category_id = #{params[:id]}"
  end

  def tickets_states
  	sql = "SELECT * FROM tickets as t inner join tickets_categories as tc on t.id = tc.ticket_id where tc.category_id = #{params[:id]}"
  end

end
