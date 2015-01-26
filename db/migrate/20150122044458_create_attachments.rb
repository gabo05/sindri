class CreateAttachments < ActiveRecord::Migration
  def change
  	if !table_exists?(:attachments)
	    create_table :attachments do |t|
	      t.string :name
	      t.string :path
	      t.boolean :state

	      t.timestamps
	    end
	end
  end
end
