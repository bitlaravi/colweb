class College < ApplicationRecord
	has_many :departments, dependent: :destroy
	has_many :cources
	has_many :staffs
	has_many :students, dependent: :destroy
	validates :college_name,:location,:college_type,:university, presence: :true
	validates :college_code, uniqueness: :true
end
