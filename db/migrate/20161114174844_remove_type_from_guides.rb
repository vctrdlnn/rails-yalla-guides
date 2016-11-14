class RemoveTypeFromGuides < ActiveRecord::Migration[5.0]
  def change
    remove_column :guides, :type, :string
  end
end
