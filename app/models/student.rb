class Student < ApplicationRecord
  belongs_to :college
  belongs_to :department
  has_many :marks, dependent: :destroy
  has_many :attendences, dependent: :destroy
  validates :register_no,:adhar_no,:pan_no, uniqueness: :true
  validates :student_name,:dob,:hslc_perscentage,:hsc_perscentage,:accomadation,:district,:state,:date_of_joining, presence: :true
end