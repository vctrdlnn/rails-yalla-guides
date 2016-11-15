class AddRoleToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :role, :string
  end
end
