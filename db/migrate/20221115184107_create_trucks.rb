class CreateTrucks < ActiveRecord::Migration[7.0]
  def change
    create_table :trucks do |t|
      t.integer :capacity

      t.timestamps
    end
  end
end
