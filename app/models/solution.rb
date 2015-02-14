class Solution < ActiveRecord::Base
	before_save :set_defaults

	def is_acepted_for?(ticket_id)
		ticket_solution = TicketsSolution.where('solution_id = ? and ticket_id = ? and acepted = (1)::bit(1)', self.id, ticket_id)

		return ticket_solution.count > 0
	end
	def proposed_by(ticket_id)
		ticket_solution = TicketsSolution.where('solution_id = ? and ticket_id = ?', self.id, ticket_id).first
		return ticket_solution.agent
	end
	def attachments
	    attachments_id = SolutionsAttachment.where('solution_id = ?', self.id).collect{ |ta| ta.attachment_id }
	    attachments = Attachment.where('id in (?)', attachments_id)
	    return attachments
	end
	private
		def set_defaults
			self.state ||= 1
		end
end
