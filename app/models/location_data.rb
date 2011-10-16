class LocationData < ActiveRecord::Base
  belongs_to :album
  belongs_to :photo
  belongs_to :location
end
