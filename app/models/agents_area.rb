class AgentsArea < ActiveRecord::Base
	belongs_to :area
	belongs_to :agent
end