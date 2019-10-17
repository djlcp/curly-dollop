class EmployeesUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :first_name, :string
    add_column :employees, :last_name, :string
    add_column :employees, :avatar, :string
    add_column :employees, :phone_number, :string
  end
end
