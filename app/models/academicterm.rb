class Academicterm < ActiveRecord::Base
  has_many :curriculums
  TERMHASH = {
 "Güz" => "Güz",
   "Bahar" => "Bahar",
  "Yaz" => "Yaz"
}
end
