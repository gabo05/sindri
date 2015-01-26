class Agent < ActiveRecord::Base
  belongs_to :appointment

  before_save :set_defaults

  private
	  def set_defaults
	  	self.appointment ||= Appointment.find(1)
	  	self.state ||= 1
	  end
end
