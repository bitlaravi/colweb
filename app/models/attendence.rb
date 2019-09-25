class Attendence < ApplicationRecord
  belongs_to :student
  before_save :set_absent
	before_save :set_average
	before_save :set_exam_eligibility
end
	def set_absent
		self.absent =(self.total_hours.to_i-self.present.to_i)
	end
  
  def set_average
  	self.average =(self.total_hours.to_i-self.absent.to_i)
  end
  def set_exam_eligibility
  	if self.average.to_i >=50
  		self.exam_eligibility = "yes"
  	else
  		self.exam_eligibility ="No"
  	end
  	
  end