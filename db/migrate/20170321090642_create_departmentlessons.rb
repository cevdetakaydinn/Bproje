class CreateDepartmentlessons < ActiveRecord::Migration
  def change
    create_table :departmentlessons do |t|
      t.integer :hour_amount
      t.belongs_to :lesson, index: true, foreign_key: true
      t.belongs_to :departmentlicense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
