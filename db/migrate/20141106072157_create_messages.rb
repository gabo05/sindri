class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :client
      t.references :agent
      t.references :conversation
      t.text :text
      t.boolean :state

      t.timestamps
    end
    add_index :messages, :client_id
    add_index :messages, :agent_id
    add_index :messages, :conversation_id
  end
end
