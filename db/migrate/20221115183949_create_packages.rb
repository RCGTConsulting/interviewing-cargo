class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.integer :size

      t.timestamps
    end
  end
end
