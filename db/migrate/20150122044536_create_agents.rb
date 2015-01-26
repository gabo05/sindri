class CreateAgents < ActiveRecord::Migration
  def change
  	if !table_exists?(:agents)
	    create_table :agents do |t|
	      t.references :appointment, index: true
	      t.string :first_name
	      t.string :last_name
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
