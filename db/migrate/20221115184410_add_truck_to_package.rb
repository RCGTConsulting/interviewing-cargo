class AddTruckToPackage < ActiveRecord::Migration[7.0]
  def change
    add_reference :packages, :truck, null: true, foreign_key: true
  end
end
