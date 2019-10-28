class Skill < ApplicationRecord
    has_many :job_posting, through: :job_postings_skills
    belongs_to :employees, through: :employee_skills

    enum type: { creative_thinking: 0, logical_thinking: 1, problem_solving: 2, adaptabilyty: 3, collaboration: 4, communication: 5, flexibility: 6, verbal_communication: 7, writing: 8, multitasking: 9, organizational: 10, social: 11, teamwork: 12, computer: 13, languages: 14 }

end