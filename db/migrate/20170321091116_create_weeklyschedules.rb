class CreateWeeklyschedules < ActiveRecord::Migration
  def change
    create_table :weeklyschedules do |t|
      t.belongs_to :lessonhours, index: true, foreign_key: true
      t.belongs_to :day, index: true, foreign_key: true
      t.belongs_to :curriculum, index: true, foreign_key: true
      t.belongs_to :classroom, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
