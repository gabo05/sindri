class Email < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent
  attr_accessible :email, :state
end
