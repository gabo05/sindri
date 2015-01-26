class CreateSchedules < ActiveRecord::Migration
  def change
  	if !table_exists?(:schedules)
	    create_table :schedules do |t|
	      t.text :description
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
