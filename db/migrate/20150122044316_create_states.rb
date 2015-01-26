class CreateStates < ActiveRecord::Migration
  def change
  	if !table_exists?(:states)
	    create_table :states do |t|
	      t.string :name
	      t.text :description
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
