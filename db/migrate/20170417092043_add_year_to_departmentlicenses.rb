class AddYearToDepartmentlicenses < ActiveRecord::Migration
  def change
    add_column :departmentlicenses, :year, :int
  end
end
