class CreateTickets < ActiveRecord::Migration
  def change
    if !table_exists?(:tickets)
      create_table :tickets do |t|
        t.references :priority, index: true
        t.references :client, index: true
        t.string :title
        t.text :description
        t.boolean :state

        t.timestamps
      end
    end
  end
end
