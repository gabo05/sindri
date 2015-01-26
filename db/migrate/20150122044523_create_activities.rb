class CreateActivities < ActiveRecord::Migration
  def change
    if !table_exists?(:activities)
      create_table :activities do |t|
        t.integer :number
        t.references :schedule, index: true
        t.string :name
        t.text :description
        t.datetime :start_at
        t.datetime :end_at
        t.integer :predecessor
        t.boolean :completed
        t.boolean :state

        t.timestamps
      end
    end
  end
end
