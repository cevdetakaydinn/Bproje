class Curriculum < ActiveRecord::Base
  belongs_to :departmentlesson
  belongs_to :academicterm
  belongs_to :instructor
  has_many :weeklylschedules

end
