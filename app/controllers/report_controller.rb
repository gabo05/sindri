class ReportController < ApplicationController
  include ReportHelper
  def index
  end
  def get_result query
     result = ActiveRecord::Base.connection.exec_query(query)
     return { :columns => result.columns.collect{ |x| x.capitalize }, :data => result.rows }
  end
  def tickets_agents
    if request.xhr?
      	sql = "select * from fnRptTicketsxAgents(#{params[:id]}, '#{params[:from].to_sqldate}', '#{params[:to].to_sqldate}')"
        result = get_result(sql)

        render :json => result
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
  def tickets_clients
    if request.xhr?
    	sql = "select * from fnRptTicketsxClients(#{params[:id]}, '#{params[:from].to_sqldate}', '#{params[:to].to_sqldate}')"
      result = get_result(sql)

      render :json => result
    end
    user = YAML.load(session[:user])
    @clients = Business.clients user.business_id
  end

  def tickets_categories
    if request.xhr?
    	sql = "SELECT * FROM fnRptTicketsxCategories(#{params[:id]}, #{params[:from].to_sqldate}, #{params[:to].to_sqldate})"
      render :json => get_result(sql)
    end
    user = YAML.load(session[:user])
    @categories = Business.categories user.business_id
  end

  def tickets_states
    if request.xhr?
    	sql = "SELECT * FROM fnRptTicketsxStates(#{params[:id]}, #{params[:from].to_sqldate}, #{params[:to].to_sqldate})"
      result = get_result(sql)

      render :json => result
    end
    user = YAML.load(session[:user])
    @states = Business.states user.business_id
  end
  def solutions_agents
    if request.xhr?
        sql = "select * from fnRptSolutionsxAgents(#{params[:id]}, #{params[:mont].to_sqldate})"
        result = get_result(sql)

        render :json => result
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
  def time_solutions_agents
    if request.xhr?
        sql = "select * from fnRptTimeSolutionsxAgents(#{params[:id]}, #{params[:from].to_sqldate}, #{params[:to].to_sqldate})"
        result = get_result(sql)

        render :json => result
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
end
