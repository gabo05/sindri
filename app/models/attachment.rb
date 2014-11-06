class Attachment < ActiveRecord::Base
  attr_accessible :name, :path, :state
end
