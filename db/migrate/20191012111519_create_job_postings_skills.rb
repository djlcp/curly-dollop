class CreateJobPostingsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :job_postings_skills do |t|
      t.integer :job_posting_id
      t.integer :skill_id
    end
  end
end
