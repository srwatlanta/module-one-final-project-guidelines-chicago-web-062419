class ChangeColumnNameForDestinations <ActiveRecord::Migration[5.0]
    def change 
        rename_column :destinations, :type, :terrain
    end 
end 