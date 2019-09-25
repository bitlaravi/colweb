class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :student
  has_one :department
  has_one :college
  ADMIN = 1
  COLLEGE = 2
  STAFF = 3
  STUDENT = 4
  DEPARTMENT = 5
end
