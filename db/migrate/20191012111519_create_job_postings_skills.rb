class CreateJobPostingsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings_skills
    add_column :job_postings_skills, :job_posting_id, :int
    add_column :job_postings_skills, :skill_id, :int
  end
end
