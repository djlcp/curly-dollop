class CreateFeedbacks < ActiveRecord::Migration[6.0]
  def change
    create_table :feedbacks
    add_column :feedbacks, :job_posting_id, :int
    add_column :feedbacks, :employee_id, :int
    add_column :feedbacks, :rating, :int
    add_column :feedbacks, :content, :text
  end
end
