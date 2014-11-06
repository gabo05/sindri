class Appointment < ActiveRecord::Base
  attr_accessible :description, :name, :state
end
