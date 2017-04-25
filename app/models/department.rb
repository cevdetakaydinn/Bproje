class Department < ActiveRecord::Base
  belongs_to :facility
  has_many :departmentlicenses, dependent: :destroy
  accepts_nested_attributes_for :departmentlicenses, reject_if: :all_blank, allow_destroy: true
  has_many :classrooms, dependent: :destroy
  validates :name, presence: true
end
