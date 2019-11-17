class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :job_applications
  has_many :job_postings, through: :job_applications
  has_many :feedbacks
  has_one :employee_profile, dependent: :destroy

end
