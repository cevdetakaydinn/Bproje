class CreateCurriculums < ActiveRecord::Migration
  def change
    create_table :curriculums do |t|
      t.belongs_to :departmentlesson, index: true, foreign_key: true
      t.belongs_to :academicterm, index: true, foreign_key: true
      t.belongs_to :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
