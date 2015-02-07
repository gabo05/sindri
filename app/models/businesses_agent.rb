class BusinessesAgent < ActiveRecord::Base
	belongs_to :agent
	belongs_to :business
end