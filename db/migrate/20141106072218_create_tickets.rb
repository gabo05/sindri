class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :priority
      t.references :client
      t.string :title
      t.text :description
      t.boolean :state

      t.timestamps
    end
    add_index :tickets, :priority_id
    add_index :tickets, :client_id
  end
end
