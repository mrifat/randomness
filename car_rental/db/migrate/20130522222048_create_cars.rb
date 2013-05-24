class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :type
      t.integer :model
      t.decimal :rent_price
      t.string :state

      t.timestamps
    end
  end
end
