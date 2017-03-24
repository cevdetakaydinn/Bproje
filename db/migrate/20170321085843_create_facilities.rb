class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.string :name
      t.belongs_to :university, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
