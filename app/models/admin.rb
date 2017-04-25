class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :curriculums, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :id_number, presence: true, uniqueness: true, length: {is: 11}
  validates :name, :surname, :rank, presence: true
  RANKHASH = {
    1 => "Yar. Doç. Dr.",
    2 => "Doç. Dr.",
    3 => "Professor",
  }
end
