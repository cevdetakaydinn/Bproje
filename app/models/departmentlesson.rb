class Departmentlesson < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :departmentlicense
end
