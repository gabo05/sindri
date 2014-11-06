class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :client
      t.references :agent
      t.string :email
      t.boolean :state

      t.timestamps
    end
    add_index :emails, :client_id
    add_index :emails, :agent_id
  end
end
