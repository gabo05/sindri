class CreateCategories < ActiveRecord::Migration
  def change
  	if !table_exists?(:categories)
	    create_table :categories do |t|
	      t.string :name
	      t.text :description
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
