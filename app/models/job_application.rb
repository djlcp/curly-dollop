class JobApplication < ApplicationRecord
    belongs_to :job_posting
    belongs_to :employee

    accepts_nested_attributes_for allow_destroy: true

    validates(:content, presence: true)
end