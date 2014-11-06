class Notification < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :agent
  attr_accessible :description, :state, :subject
end
