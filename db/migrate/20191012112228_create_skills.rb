class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills
    add_column :skills, :name, :string
  end
end
