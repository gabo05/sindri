class CreateAccounts < ActiveRecord::Migration
  def change
  	if !table_exists?(:accounts)
	    create_table :accounts do |t|
	      t.references :email, index: true
	      t.string :passsword
	      t.string :picture
	      t.boolean :confirmed
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
