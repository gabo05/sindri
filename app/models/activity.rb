class Activity < ActiveRecord::Base
  belongs_to :schedule
  attr_accessible :completed, :description, :end_at, :name, :number, :predecessor, :start_at, :state
end
