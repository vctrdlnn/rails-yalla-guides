class CreateStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :statuses do |t|
      t.integer :code
      t.string :title

      t.timestamps
    end
  end
end
