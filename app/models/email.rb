class Email < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent

  before_save :set_defaults

  def initialize(email=nil, agent=nil)
    super()
    if email != nil and agent != nil
    	self.agent = agent
    	self.email = email
    end
  end
  private
	  def set_defaults
	  	self.state ||= 1
	  end
end
