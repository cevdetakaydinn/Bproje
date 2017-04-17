class University < ActiveRecord::Base
  has_many :facilities
  accepts_nested_attributes_for :facilities, reject_if: :all_blank, allow_destroy: true
end
