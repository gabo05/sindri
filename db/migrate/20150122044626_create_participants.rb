class CreateParticipants < ActiveRecord::Migration
  def change
    if !table_exists?(:participants)
      create_table :participants do |t|
        t.references :client, index: true
        t.references :agent, index: true
        t.references :conversation, index: true
        t.boolean :is_online
        t.boolean :state

        t.timestamps
      end
    end
  end
end
