class Departmentlesson < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :departmentlicense
  has_many :curriculums, dependent: :destroy
  validates :departmentlicense_id, :lesson_id, presence: true

end
