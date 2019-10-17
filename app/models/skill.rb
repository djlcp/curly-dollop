class Skill < ApplicationRecord
    belongs_to :job_posting, through: :job_postings_skills
    has_many :employees, through: :employee_skills
end