class ScheduleController < ApplicationController
  def index
  	user = YAML.load(session[:user])

  	schedule_agent = SchedulesAgent.where('state = (1)::bit(1) and agent_id = ? and business_id = ?', user.id, user.business_id).first

  	if(schedule_agent != nil)
  		@schedule = Schedule.where('state = (1)::bit(1) and id = ?', schedule_agent.schedule_id).first
  	else
  		@schedule = nil
  	end
  end
  def activities
  	activities = Activity.where('state = (1)::bit(1) and schedule_id = ?', params[:id]).collect{ |a| a.json_for_schedule }
    if(activities.count() > 0)
      
      render :json => { :status => 'OK', :data => { :navigate => "scroll", :maxScale => "days", :itemsPerPage => 10, :source => activities  } }
    else
      render :json => { :status => 'NO-RECORDS', :data => { :navigate => "scroll", :maxScale => "days", :itemsPerPage => 10, :source => Array.new(0) } }
    end
  end
  def create
    user = YAML.load(session[:user])
    schedule = Schedule.new

    if(schedule.save)
      schedule_agent = SchedulesAgent.new
      schedule_agent.schedule = schedule
      schedule_agent.agent_id = user.id
      schedule_agent.business_id = user.business_id

      if schedule_agent.save
        flash[:message] = {'type'=>"success",'text' => "El cronograma ha sido creado correctamente"}
      end
    end

  	redirect_to url_for controller: 'schedule', action: 'index'
  end
  def add_activity
    activity = Activity.new
    activity.schedule_id = params[:schedule_id]
    activity.name = params[:name]
    activity.description = params[:description][0]
    activity.start_at = params[:start_date].to_date
    activity.end_at = params[:end_date].to_date

    if(activity.save)
      render :json => { :status => 'OK', :message => 'Actividad registrada', :data => activity.json_for_schedule }
    else
      render :json => { :status => 'ERROR', :message => 'Ocurrió un problema al registrar la actividad', :data => activity.json_for_schedule }
    end
  end
end
