class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :employee_skills
  has_many :skills, through: :employee_skills
  has_many :job_applications
  has_many :job_postings, through: :job_applications
  has_many :feedbacks

end
