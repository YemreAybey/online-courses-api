class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :author
      t.string :duration
      t.text :detail

      t.timestamps
    end
  end
end
