class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :number
      t.references :schedule
      t.string :name
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :predecessor
      t.boolean :completed
      t.boolean :state

      t.timestamps
    end
    add_index :activities, :schedule_id
  end
end
