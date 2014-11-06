class Message < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent
  belongs_to :conversation
  attr_accessible :state, :text
end
