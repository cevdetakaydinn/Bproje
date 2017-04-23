class University < ActiveRecord::Base
  has_many :facilities, dependent: :destroy
  accepts_nested_attributes_for :facilities, reject_if: :all_blank, allow_destroy: true
end
