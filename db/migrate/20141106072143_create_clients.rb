class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :business
      t.references :appointment
      t.string :first_name
      t.string :last_name
      t.boolean :state

      t.timestamps
    end
    add_index :clients, :business_id
    add_index :clients, :appointment_id
  end
end
