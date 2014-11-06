class Client < ActiveRecord::Base
  belongs_to :business
  belongs_to :appointment
  attr_accessible :first_name, :last_name, :state
end
