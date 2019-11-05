class AddEmployeeIdToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :employee_id, :integer
  end
end
