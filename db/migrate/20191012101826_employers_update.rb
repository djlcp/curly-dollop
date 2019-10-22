class EmployersUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :employers, :first_name, :string
    add_column :employers, :last_name, :string
    add_column :employers, :business_name, :string
    add_column :employers, :profile, :string
  end
end
