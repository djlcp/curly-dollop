class AddTypeToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :role, :integer
  end
end
