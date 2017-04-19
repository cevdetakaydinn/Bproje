class Departmentlicense < ActiveRecord::Base
  belongs_to :department
  belongs_to :license
  has_many :departmentlessons
end
