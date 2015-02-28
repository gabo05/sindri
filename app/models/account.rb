class Account < ActiveRecord::Base
    belongs_to :email
    has_many :accounts_role
    before_save :set_defaults

    def initialize(email = nil, password = nil, picture = 'avatar_default.png')
        super()
        if email != nil and password != nil
            self.email = email
            self.passsword = password
            self.picture = picture
        end
    end
    def full_name
        if is_agent?
    	   return self.email.agent.full_name
        elsif is_client?
            return self.email.client.full_name
        end
    end

    def is_agent?
    	self.email.agent != nil && self.email.agent.id != nil
    end

    def is_client?
    	self.email.client != nil && self.email.client.id != nil
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
