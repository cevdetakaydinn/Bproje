class CreateLessonhours < ActiveRecord::Migration
  def change
    create_table :lessonhours do |t|
      t.datetime :beginning
      t.datetime :ending

      t.timestamps null: false
    end
  end
end
