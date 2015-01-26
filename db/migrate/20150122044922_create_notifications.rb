class CreateNotifications < ActiveRecord::Migration
  def change
    if !table_exists?(:notifications)
      create_table :notifications do |t|
        t.references :ticket, index: true
        t.references :agent, index: true
        t.string :subject
        t.text :description
        t.boolean :state

        t.timestamps
      end
    end
  end
end
