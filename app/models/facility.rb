class Facility < ActiveRecord::Base
  belongs_to :university
  has_many :departments
  accepts_nested_attributes_for :departments, reject_if: :all_blank, allow_destroy: true
end
