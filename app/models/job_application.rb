class JobApplication < ApplicationRecord
    belongs_to :job_posting
    belongs_to :employee

    enum status: %i[accepted rejected]

end