class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.references :client
      t.references :agent
      t.references :conversation
      t.boolean :is_online
      t.boolean :state

      t.timestamps
    end
    add_index :participants, :client_id
    add_index :participants, :agent_id
    add_index :participants, :conversation_id
  end
end
