class CreateSolutions < ActiveRecord::Migration
  def change
    if !table_exists?(:solutions)
	    create_table :solutions do |t|
	      t.string :title
	      t.text :description
	      t.string :version
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
