class JobPosting < ApplicationRecord
  has_many :job_postings_skills
  has_many :skills, through: :job_postings_skills
  belongs_to :employer
  has_many :employees, through: :job_applications
  has_many :feedbacks
  has_many :job_applications

  accepts_nested_attributes_for :skills, allow_destroy: true

  validates(:content, presence: true)
end
