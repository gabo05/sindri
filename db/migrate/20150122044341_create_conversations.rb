class CreateConversations < ActiveRecord::Migration
  def change
  	if !table_exists?(:conversations)
	    create_table :conversations do |t|
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
