class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.references :ticket
      t.references :agent
      t.string :subject
      t.text :description
      t.boolean :state

      t.timestamps
    end
    add_index :notifications, :ticket_id
    add_index :notifications, :agent_id
  end
end
