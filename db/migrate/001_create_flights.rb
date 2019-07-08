class CreateFlights < ActiveRecord::Migration[5.0]
    def change
        create_table :flights do |t|
            t.integer :destination_id
            t.integer :passenger_id
            t.string :carrier
            t.boolean :nonstop
        end
    end
end