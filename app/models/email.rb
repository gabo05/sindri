class Email < ActiveRecord::Base
  belongs_to :client
  belongs_to :agent

  before_save :set_defaults

  private
	  def set_defaults
	  	self.state ||= 1
	  end
end
