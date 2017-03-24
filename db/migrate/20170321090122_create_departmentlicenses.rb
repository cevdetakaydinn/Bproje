class CreateDepartmentlicenses < ActiveRecord::Migration
  def change
    create_table :departmentlicenses do |t|
      t.integer :grades
      t.boolean :has_night
      t.belongs_to :department, index: true, foreign_key: true
      t.belongs_to :license, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
