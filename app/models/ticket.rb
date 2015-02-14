class Ticket < ActiveRecord::Base
  belongs_to :priority
  belongs_to :client
  has_many :tickets_agent

  def agents
  	agent_ids = TicketsAgent.where('ticket_id = ? and state = (1)::bit(1)', self.id).collect{ |ta| ta.agent_id }
  	agents = Agent.where('id in (?) and state = (1)::bit(1)', agent_ids)
  	return agents
  end
  def attachments
    attachments_id = TicketsAttachment.where('ticket_id = ?', self.id).collect{ |ta| ta.attachment_id }
    attachments = Attachment.where('id in (?)', attachments_id)
    return attachments
  end
  def current_state
  	state_ticket = TicketsState.where('ticket_id = ? and is_current = (1)::bit(1) and state = (1)::bit(1)', self.id).first
  	state = State.where('id = ?', state_ticket.state_id).first
  	return state
  end
  def is_asigned_to?(agent)
    result = self.agents.where('id = ?', agent.id)
    return result.count > 0
  end
end
