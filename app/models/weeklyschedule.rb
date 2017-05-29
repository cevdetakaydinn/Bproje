class Weeklyschedule < ActiveRecord::Base
  belongs_to :lessonhour
  belongs_to :day
  belongs_to :curriculum
  belongs_to :classroom
end
