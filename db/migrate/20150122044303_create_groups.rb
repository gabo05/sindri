class CreateGroups < ActiveRecord::Migration
  def change
  	if !table_exists?(:groups)
  		create_table :groups do |t|
	      t.string :name
	      t.text :description
	      t.boolean :state

	      t.timestamps
    	end
  	end
  end
end
