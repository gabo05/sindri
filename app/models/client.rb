class Client < ActiveRecord::Base
  belongs_to :business
  belongs_to :appointment
end
