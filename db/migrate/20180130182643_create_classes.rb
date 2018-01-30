class CreateClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :classes do |t|
      t.string :name
      t.time :time
      t.integer :duration
      t.string :room
    end
  end
end
