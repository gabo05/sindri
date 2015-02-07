class Client < ActiveRecord::Base
  belongs_to :business
  belongs_to :appointment

  def full_name
  	return "#{self.first_name} #{self.last_name}"
  end
end
