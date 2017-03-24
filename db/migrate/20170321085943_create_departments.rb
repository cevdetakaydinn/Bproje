class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.belongs_to :facility, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
