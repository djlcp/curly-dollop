class JobPosting < ApplicationRecord
    belongs_to :employer
    has_many :skills, through: :job_postings_skills
    has_many :feedbacks
    has_many :job_applications
end