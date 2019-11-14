class AddProfessionIdToProfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :profession_id, :integer
  end
end
