class JobApplication < ApplicationRecord
    belongs_to :job_posting
    has_many :employees, through: :job_postings

    accepts_nested_attributes_for :job_postings, :skills, allow_destroy: true

    validates(:content, presence: true)
end