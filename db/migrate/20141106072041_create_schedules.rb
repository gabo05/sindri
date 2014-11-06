class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.text :description
      t.boolean :state

      t.timestamps
    end
  end
end
