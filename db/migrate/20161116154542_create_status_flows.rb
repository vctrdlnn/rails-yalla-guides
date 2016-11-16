class CreateStatusFlows < ActiveRecord::Migration[5.0]
  def change
    create_table :status_flows do |t|
      t.references :booking, foreign_key: true
      t.references :status, foreign_key: true

      t.timestamps
    end
  end
end
