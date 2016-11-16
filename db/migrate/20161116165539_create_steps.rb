class CreateSteps < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.string :establishment
      t.string :address
      t.string :city
      t.float :longitude
      t.float :latitude
      t.references :guide, foreign_key: true

      t.timestamps
    end
  end
end
