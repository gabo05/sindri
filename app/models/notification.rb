class Notification < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :agent
end
