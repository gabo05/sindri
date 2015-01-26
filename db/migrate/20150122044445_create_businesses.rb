class CreateBusinesses < ActiveRecord::Migration
  def change
    if !table_exists?(:businesses)
      create_table :businesses do |t|
        t.string :name
        t.string :logo
        t.string :color1
        t.string :color2
        t.string :color3
        t.boolean :state

        t.timestamps
      end
    end
  end
end
