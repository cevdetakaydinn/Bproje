class Curriculum < ActiveRecord::Base
  belongs_to :departmentlessons
  belongs_to :academicterm
  belongs_to :instructor
end
