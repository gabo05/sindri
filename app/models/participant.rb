class Participant < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent
  belongs_to :conversation
  attr_accessible :is_online, :state
end
