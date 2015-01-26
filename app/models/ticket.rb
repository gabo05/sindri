class Ticket < ActiveRecord::Base
  belongs_to :priority
  belongs_to :client
end
