class Activity < ActiveRecord::Base
  belongs_to :schedule
  before_save :set_defaults

  def json_for_schedule
  	ed = self.end_at.to_datetime.strftime('%Q')
  	sd = self.start_at.to_datetime.strftime("%Q")
  	return {:name => self.name, :values => [{ :from => "\/Date(#{sd})\/", :to => "\/Date(#{ed})\/", :label => self.name, :description => self.description }] }
  end
  private
  	def set_defaults
  		self.state||=1
  		self.completed||=1
  	end
end
