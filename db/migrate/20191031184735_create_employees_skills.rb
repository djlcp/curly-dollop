class CreateEmployeesSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :employees_skills do |t|

      t.timestamps
    end
  end
end
