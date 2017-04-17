class Department < ActiveRecord::Base
  belongs_to :facility
  has_many :departmentlicenses
  has_many :classrooms
end
