class Album < ActiveRecord::Base
  has_many :photos
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
