class Subject < ApplicationRecord
  belongs_to :department
  validates :subject,:subject_code, presence: :true
  validates :subject,:subject_code, uniqueness: :true
end
