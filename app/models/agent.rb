class Agent < ActiveRecord::Base
  belongs_to :appointment
  has_many :tickets_agent
  has_many :businesses_agent
  before_save :set_defaults

  def initialize(data = nil)
    super()
    if(data != nil)
      if data[:appointment_id] != nil
        self.appointment_id = data[:appointment_id]
      end
      self.first_name = data[:first_name]
      self.last_name = data[:last_name]
    end
  end
  def no_tickets
  	return self.tickets_agent.count
  end
  def email_account
    email = Email.where('agent_id = ? and state = (1)::bit(1)', self.id).first
    return email.email
  end
  def full_name
    return [self.first_name, self.last_name].join(' ')
  end
  def self.businesses id
    business_ids = BusinessesAgent.where('agent_id = ? and state = (1)::bit(1)', id).collect{ |ba| ba.business_id }

    businesses = Business.where('state = (1)::bit(1) and id in (?)', business_ids)
  end
  def business
    return Agent.businesses self.id
  end
  def self.find_by_email(email)
    email = Email.where('email = ?', email).first
    if email != nil
      return email.agent
    else
      return nil
    end
  end
  def area
    aa = AgentsArea.where('state = (1)::bit(1) and agent_id = ?', self.id).first
    area = Area.where('id = ?', aa.area_id)
    return area_id
  end
  private
	  def set_defaults
	  	self.appointment ||= Appointment.find(1)
	  	self.state ||= 1
	  end
end
