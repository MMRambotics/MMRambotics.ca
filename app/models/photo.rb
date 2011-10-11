require "fileutils"

class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :image
  has_attached_file :thumbnail

  default_scope order("updated_at DESC")

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def thumb
    if self.thumbnail_file_name.present?
      self.thumbnail.url
    else
      self.image.url
    end
  end
end
