class CreateDestinations <ActiveRecord::Migration[5.0]
    def change 
        create_table :destinations do |t|
            t.string :city
            t.integer :rating
            t.integer :average_temp
            t.string :type
        end 
    end 
end 