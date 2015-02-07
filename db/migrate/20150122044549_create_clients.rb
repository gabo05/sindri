class CreateClients < ActiveRecord::Migration
  def change
    if !table_exists?(:clients)
      create_table :clients do |t|
        t.references :business, index: true
        t.references :appointment, index: true
        t.string :first_name
        t.string :last_name
        t.string :phone_number
        t.boolean :state

        t.timestamps
      end
    end
  end
end
