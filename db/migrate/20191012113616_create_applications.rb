class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications
    add_column :applications, :job_posting_id, :int
    add_column :applications, :employee_id, :int

  end
end
