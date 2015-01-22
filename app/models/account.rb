class Account < ActiveRecord::Base
    belongs_to :email
    attr_accessible :picture, :state, :passsword
    before_save :set_defaults

    def full_name
    	return "#{@first_name} #{@last_name}"
    end

    def is_agent?
    	@email.agents_id != nil
    end

    def is_client?
    	@email.clients_id != nil
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
