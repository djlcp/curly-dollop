class JobPostingsSkill < ApplicationRecord
  belongs_to :job_posting
  belongs_to :skill
end
