require "fileutils"

class Photo < ActiveRecord::Base
  belongs_to :album

  has_attached_file :image
  has_attached_file :thumbnail

  validates_attachment_presence :image, :if => Proc.new { |i| i.image_file_name_changed? or i.new_record? }

  default_scope order("updated_at DESC")

  def next
    photo = Photo.unscoped.where(:album_id => self.album_id).where("updated_at > ?", self.updated_at).limit(1).first
    photo = Photo.unscoped.order("updated_at").limit(1).first if photo.nil?
    photo
  end

  def prev
    photo = Photo.where(:album_id => self.album_id).where("updated_at < ?", self.updated_at).limit(1).first
    photo = Photo.limit(1).first if photo.nil?
    photo
  end

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
