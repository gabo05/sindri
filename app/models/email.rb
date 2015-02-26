class Email < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent

  before_save :set_defaults

  def initialize
  	super()
  end
  def initialize(email, agent)
    super()
  	self.agent = agent
  	self.email = agent
  end
  private
	  def set_defaults
	  	self.state ||= 1
	  end
end
