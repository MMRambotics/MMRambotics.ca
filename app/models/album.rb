class Album < ActiveRecord::Base
  has_many :location_datas
  has_many :photos
  has_many :locations, :through => :location_datas
  accepts_nested_attributes_for :location_datas

  default_scope order("updated_at DESC")

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def first_image
    if self.photos.length > 0
      self.photos.first.thumb
    else
      "/no-thumbnail.jpg"
    end
  end
end
