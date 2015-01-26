class CreatePriorities < ActiveRecord::Migration
  def change
  	if !table_exists?(:priorities)
	    create_table :priorities do |t|
	      t.string :name
	      t.text :description
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
