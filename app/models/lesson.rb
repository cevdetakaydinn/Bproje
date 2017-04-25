class Lesson < ActiveRecord::Base
  has_many :departmentlessons, dependent: :destroy
  validates :name, presence: true
end
