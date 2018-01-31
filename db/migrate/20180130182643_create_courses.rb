class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.time :time
      t.integer :duration
      t.string :room
      t.integer :teacher_id
    end
  end
end
