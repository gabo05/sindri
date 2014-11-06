class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.text :description
      t.boolean :state

      t.timestamps
    end
  end
end
