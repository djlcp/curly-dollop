class JobPosting < ApplicationRecord
    has_many :job_postings_skills
    has_many :skills, through: :job_postings_skills
    belongs_to :employer
    has_many :feedbacks
    has_many :applications

    accepts_nested_attributes_for :skills

    validates(
        :content,
        presence: true
    )
end