class Flight < ActiveRecord::Base
    belongs_to :passenger
    belongs_to :destination
end