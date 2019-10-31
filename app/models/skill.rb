class Skill < ApplicationRecord
  belongs_to :job_postings
  belongs_to :employees

  enum type: %i[language proffesion]
end
