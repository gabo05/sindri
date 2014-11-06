class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :title
      t.text :description
      t.string :version
      t.boolean :state

      t.timestamps
    end
  end
end
