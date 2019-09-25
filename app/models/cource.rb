class Cource < ApplicationRecord
  belongs_to :college
  belongs_to :department
  validates :cource, presence: :true, uniqueness: :true
end
