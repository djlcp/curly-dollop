class CreateEmployeeSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :employee_skills do |t|
      t.integer :employee_id
      t.integer :skill_id
    end
  end
end
