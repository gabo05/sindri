class Agent < ActiveRecord::Base
  belongs_to :appointment
  has_many :tickets_agent
  has_many :businesses_agent
  before_save :set_defaults

  def initialize
    super()
  end
  def initialize(data)
    super()
    if data[:appointment_id] != nil
      self.appointment_id = data[:appointment_id]
    end
    self.first_name = data[:first_name]
    self.last_name = data[:last_name]

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

    businesses = Business.where('state = true and id in (?)', business_ids)
  end
  def business
    return Agent.businesses self.id
  end
  private
	  def set_defaults
	  	self.appointment ||= Appointment.find(1)
	  	self.state ||= 1
	  end
end
