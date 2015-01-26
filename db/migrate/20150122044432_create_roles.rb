class CreateRoles < ActiveRecord::Migration
  def change
  	if !table_exists?(:roles)
	    create_table :roles do |t|
	      t.string :name
	      t.text :description
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
