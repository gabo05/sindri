class CreateMessages < ActiveRecord::Migration
  def change
    if !table_exists?(:messages)
      create_table :messages do |t|
        t.references :client, index: true
        t.references :agent, index: true
        t.references :conversation, index: true
        t.text :text
        t.boolean :state

        t.timestamps
      end
    end
  end
end
