class AddCategoryToSteps < ActiveRecord::Migration[5.0]
  def change
    add_column :steps, :category, :string
  end
end
