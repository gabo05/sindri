class Agent < ActiveRecord::Base
  belongs_to :appointment
  has_many :tickets_agent
  has_many :businesses_agent
  before_save :set_defaults

  def no_tickets
  	return self.tickets_agent.count
  end
  def full_name
    return "#{self.first_name} #{self.last_name}"
  end
  private
	  def set_defaults
	  	self.appointment ||= Appointment.find(1)
	  	self.state ||= 1
	  end
end
