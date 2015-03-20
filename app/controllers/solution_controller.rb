class SolutionController < ApplicationController
	include ApplicationHelper
    def index
        if(params[:key])
            key = params[:key]
            all_solutions = Solution.where('title like ? or description like ?', "%#{key}%", "%#{key}%")
            @pagination = Pagination.new params[:page], params[:size], all_solutions
            @solutions = @pagination.get_records
        end
    end
    def show
        @solution = Solution.where('id = ?', params[:id]).first
        @ticket_id = TicketsSolution.where('solution_id = ?', params[:id]).first.ticket_id
    end
    def acept
    	@user = YAML.load(session[:user])
    	solution = TicketsSolution.where('ticket_id = ? and solution_id = ?', params[:ticket_id], params[:solution_id]).first
    	solution.acepted = 1
    	solution.save
    	redirect_to url_for controller: 'solution', action: 'solution', id: params[:ticket_id]
    end
    def solution
    	@ticket = Ticket.where('id = ?', params[:id]).first
    	solution_ids = TicketsSolution.where('ticket_id = ? and state = (1)::bit(1)', @ticket.id).collect{ |ts| ts.solution_id }
    	@solutions = Solution.where('id in (?)', solution_ids)
    	@user = YAML.load(session[:user])
    end
    def create
    	user = YAML.load(session[:user])

    	data = params[:solution]
    	solution = Solution.new
    	solution.title = data[:title]
    	solution.description = data[:description]
    	if solution.save
    		#Save Attachments
    		attachments = params[:attachments]
            if(attachments != nil)
                attachments.each do |file|
                    path = Rails.root.join('public', 'attachments', file.original_filename)
                    attachment = Attachment.new
                    attachment.name = file.original_filename
                    attachment.path = path.to_s
                    if attachment.save
                        upload_file_to(file, path)
                        ta = SolutionsAttachment.new
                        ta.solution = solution
                        ta.attachment = attachment
                        ta.save
                    end
                end
            end
    		#Save solution
    		ticket_solution = TicketsSolution.new
    		ticket_solution.solution = solution
    		ticket_solution.ticket_id = params[:ticket_id]
    		ticket_solution.agent_id = user.id
    		ticket_solution.acepted = 0
    		if ticket_solution.save
                ticket = Ticket.where('id = ?', params[:ticket_id]).first
                NotificationMailer.solved_ticket(ticket.client_id, ticket.id).deliver
    		end
    	end
    	redirect_to url_for controller: 'solution', action: 'solution', id: params[:ticket_id]
    end
end
