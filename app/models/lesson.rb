class Lesson < ActiveRecord::Base
  has_many :departmentlessons, dependent: :destroy
end
