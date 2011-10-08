class Ad < ActiveRecord::Base
  validates_presence_of :title, :external_url, :image, :format

  scope :rotating_sidebar, where(:format => "rotating", :active => true).order("priority DESC")
  scope :dashboard, where(:active => true).order("updated_at DESC").limit(15).group(:format)
end
