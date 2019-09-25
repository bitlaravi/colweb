class Staff < ApplicationRecord
  belongs_to :department
  belongs_to :college
  validates :staff_name,:posission,:contact_no,:email_id, presence:true
end
