class Mark < ApplicationRecord
  belongs_to :student
  before_save :set_result
  validates :mark,presence: :true

  def set_result
  	if self.mark.to_i >= 35
  		self.result = "Pass"
    else
  		self.result = "Fail"
    end
  end
end
