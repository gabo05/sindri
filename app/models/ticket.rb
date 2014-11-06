class Ticket < ActiveRecord::Base
  belongs_to :priority
  belongs_to :client
  attr_accessible :description, :state, :title
end
