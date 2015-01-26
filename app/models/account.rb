class Account < ActiveRecord::Base
    belongs_to :email
    before_save :set_defaults

    def full_name
    	return "#{@first_name} #{@last_name}"
    end

    def is_agent?
    	self.email.agent.id != nil
    end

    def is_client?
    	self.email.client.id != nil
    end

    def type
    	if is_agent?
    		return 'agent'
    	elsif is_client?
    		return 'client'
    	else
    		return nil
    	end
    end

    private
      def set_defaults
        self.state ||= 1
      end
end
