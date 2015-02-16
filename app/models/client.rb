class Client < ActiveRecord::Base
  belongs_to :business
  belongs_to :appointment
  before_save :set_defaults

  def full_name
  	return [self.first_name, self.last_name].join(' ')
  end
  def email_account
    email = Email.where('client_id = ? and state = (1)::bit(1)', self.id).first
    return email.email
  end
  private
      def set_defaults
        self.state ||= 1
      end
end
