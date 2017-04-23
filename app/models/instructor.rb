class Instructor < ActiveRecord::Base
  has_many :curriculums, dependent: :destroy
end
