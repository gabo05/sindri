module TicketHelper
    include ApplicationHelper
	def get_tickets_for(user)
		if(user.type == 'client')
    		tickets = Ticket.where('client_id = ?', user.id)
    	else
            if user.is_in_role? 'admin' or user.is_in_role? 'ticket_admin'
                tickets= Ticket.where('business_id = ?', user.business_id)
            else
                ticket_ids = TicketsAgent.where('agent_id = ?', user.id).collect{ |ta| ta.ticket_id }
        		tickets = Ticket.where('id in (?) and business_id = ?', ticket_ids, user.business_id)
            end
    	end
    	return tickets
	end
    def open_ticket(data, attachments, params)
        user = YAML.load(session[:user])
        
        #Create the ticket
        ticket = Ticket.new(data)
        
        ticket.client_id = user.id
        ticket.business_id = user.business_id

        if ticket.save
            #Set the state to Open
            state = State.where('"order" = 1 and state = (1)::bit(1)').first
            ticket_state = TicketsState.new(ticket.id, state.id, nil, user.id)
            ticket_state.save 
            #Save the attachments
            if(attachments != nil)
                attachments.each do |file|
                    path = Rails.root.join('public', 'attachments', file.original_filename)
                    attachment = Attachment.new
                    attachment.name = file.original_filename
                    attachment.path = path.to_s
                    if attachment.save
                        upload_file_to(file, path)
                        ta = TicketsAttachment.new
                        ta.ticket = ticket
                        ta.attachment = attachment
                        ta.save
                    end
                end
            end
            #save the category
            ticket_category = TicketsCategory.new(ticket.id, data[:category_id])
            ticket_category.save
        end
    end
end
