class Agent < ActiveRecord::Base
  belongs_to :appointment
  attr_accessible :first_name, :last_name, :state

  before_save :set_defaults

  private
	  def set_defaults
	  	self.appointment ||= Appointment.find(1)
	  	self.state ||= 1
	  end
end
