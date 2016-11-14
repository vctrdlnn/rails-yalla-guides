class AddCategoryToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :category, :string
  end
end
