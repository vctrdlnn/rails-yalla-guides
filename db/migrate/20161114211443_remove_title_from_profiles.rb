class RemoveTitleFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :title, :string
  end
end
