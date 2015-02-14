class Client < ActiveRecord::Base
  belongs_to :business
  belongs_to :appointment
  before_save :set_defaults

  def full_name
  	return "#{self.first_name} #{self.last_name}"
  end
  private
      def set_defaults
        self.state ||= 1
      end
end
