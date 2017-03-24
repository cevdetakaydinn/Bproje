class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.integer :number
      t.integer :size
      t.belongs_to :department, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
