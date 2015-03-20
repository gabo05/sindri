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
    	sql = "SELECT * FROM fnRptTicketsxCategories(#{params[:id]}, '#{params[:from].to_sqldate}', '#{params[:to].to_sqldate}')"
      render :json => get_result(sql)
    end
    user = YAML.load(session[:user])
    @categories = Business.categories user.business_id
  end
  def graphic_tickets_categories
    if request.xhr?
      user = YAML.load(session[:user])

      categories = Business.categories user.business_id

      data = []

      for category in categories
        ctickets = get_result("SELECT * FROM fnRptTicketsxCategories(#{category.id},'#{params[:gfrom].to_sqldate}', '#{params[:gto].to_sqldate}')")
        d = {:name => category.name, :data => [ctickets[:data].count]}
        data.push(d)
      end

      render :json => data
    end
  end
  def tickets_states
    if request.xhr?
    	sql = "SELECT * FROM fnRptTicketsxStates(#{params[:id]}, '#{params[:from].to_sqldate}', '#{params[:to].to_sqldate}')"
      result = get_result(sql)

      render :json => result
    end
    user = YAML.load(session[:user])
    @states = Business.states user.business_id
  end
  def graphic_tickets_states
    if request.xhr?
      user = YAML.load(session[:user])

      states = Business.states(user.business_id)

      data = []

      for state in states 
        stickets = get_result("SELECT * FROM fnRptTicketsxStates(#{state.id}, '#{params[:gfrom].to_sqldate}', '#{params[:gto].to_sqldate}')")
        d = {:name => state.name, :data => [stickets[:data].count]}
        data.push(d)
      end

      render :json => data
    end
  end

  def solutions_agents
    if request.xhr?
        sql = "select * from fnRptSolutionsxAgents(#{params[:id]}, #{params[:month].to_sqldate})"
        result = get_result(sql)

        render :json => result
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
  def graphic_solutions_agents
    if request.xhr?
        sql = "select * from fnRptSolutionsxAgents(-2, #{params[:gmonth].to_sqldate})"
        result = get_result(sql)

        data = []

        for row in result[:data]
          d = {:name => row[0], :data => [row[1].to_i] }
          data.push(d)
        end

        render :json => data
    end
  end
  def time_solutions_agents
    if request.xhr?
        sql = "select * from fnRptTimeSolutionsxAgents(#{params[:id]}, '#{params[:from].to_sqldate}', '#{params[:to].to_sqldate}')"
        result = get_result(sql)

        render :json => result
    end
    user = YAML.load(session[:user])
    @agents = Business.agents user.business_id
  end
end
