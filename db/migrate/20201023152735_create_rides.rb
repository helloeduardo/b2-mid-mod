class CreateRides < ActiveRecord::Migration[5.2]
  def change
    create_table :rides do |t|
      t.string :name
      t.integer :thrill
      t.references :amusement_park, foreign_key: true

      t.timestamps
    end
  end
end
