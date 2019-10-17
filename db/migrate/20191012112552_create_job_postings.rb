class CreateJobPostings < ActiveRecord::Migration[6.0]
  def change
    add_column :job_postings, :content, :text
    add_column :job_postings, :start_time, :datetime
    add_column :job_postings, :end_time, :datetime
    add_column :job_postings, :hourly_rate, :float
    add_column :job_postings, :employer_id, :int
  end
end
