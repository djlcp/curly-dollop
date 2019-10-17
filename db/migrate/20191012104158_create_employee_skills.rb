class CreateEmployeeSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :employee_skills, :employee_id, :int
    add_column :employee_skills, :skill_id, :int
  end
end
