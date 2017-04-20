class CreateAcademicterms < ActiveRecord::Migration
  def change
    create_table :academicterms do |t|
      t.string :term
      t.integer :year

      t.timestamps null: false
    end
  end
end
