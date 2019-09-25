class Department < ApplicationRecord
  belongs_to :college
  has_many :lab_specilities, dependent: :destroy
  has_many :cources, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :students, dependent: :destroy
  validates :department_name,:department_code, uniqueness: :true
end
