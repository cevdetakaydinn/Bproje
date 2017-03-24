class Departmentlicense < ActiveRecord::Base
  belongs_to :department
  belongs_to :license
end
