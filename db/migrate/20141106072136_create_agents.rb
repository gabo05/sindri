class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.references :appointment
      t.string :first_name
      t.string :last_name
      t.boolean :state

      t.timestamps
    end
    add_index :agents, :appointment_id
  end
end
