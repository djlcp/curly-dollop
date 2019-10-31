class CreateJobPostingSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :job_posting_skills do |t|

      t.timestamps
    end
  end
end
