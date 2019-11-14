class JobPosting < ApplicationRecord
  belongs_to :employer
  belongs_to :profession
  has_many :feedbacks
  has_many :job_applications

  validates(:content, presence: true)
end
