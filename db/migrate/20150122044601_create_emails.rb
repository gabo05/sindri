class CreateEmails < ActiveRecord::Migration
  def change
  	if !table_exists?(:emails)
	    create_table :emails do |t|
	      t.references :client, index: true
	      t.references :agent, index: true
	      t.string :email
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
