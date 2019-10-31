class Skill < ApplicationRecord
  has_many :employees_skills
  has_many :employees, through: :employees_skills
  has_many :job_postings_skill
  has_many :skills, through: :job_postings_skill

  enum type: %i[language proffesion]

  validates(:name, presence: true)
end
