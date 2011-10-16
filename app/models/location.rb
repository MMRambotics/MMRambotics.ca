class Location < ActiveRecord::Base
  belongs_to :album
  belongs_to :photo
  geocoded_by :place
  after_validation :geocode, :if => :place_changed?

  # For Formtastic collections.
  def name
    self.place
  end
end
