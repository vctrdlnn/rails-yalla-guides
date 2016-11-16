class AddAddressToGuides < ActiveRecord::Migration[5.0]
  def change
    add_column :guides, :address, :string
  end
end
