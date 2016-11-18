class AddParamsToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :photo, :string
    add_column :profiles, :aboutme, :text
    add_column :profiles, :hometown, :string
    add_column :profiles, :birthday, :date
  end
end
