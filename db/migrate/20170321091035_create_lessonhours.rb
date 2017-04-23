class CreateLessonhours < ActiveRecord::Migration
  def change
    create_table :lessonhours do |t|
      t.time :beginning
      t.time :ending

      t.timestamps null: false
    end
  end
end
