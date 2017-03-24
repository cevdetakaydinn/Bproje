class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :name
      t.string :surname
      t.integer :id_number
      t.integer :rank
      t.string :email
      t.string :password

      t.timestamps null: false
    end
  end
end
