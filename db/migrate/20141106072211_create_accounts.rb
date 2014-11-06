class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :email
      t.string :passsword
      t.string :picture
      t.boolean :state

      t.timestamps
    end
    add_index :accounts, :email_id
  end
end
