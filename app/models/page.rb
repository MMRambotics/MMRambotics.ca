class Page < ActiveRecord::Base
  before_save :change_index, :if => :is_index?
  belongs_to :menu
  validate :external_link_only, :if => :external_link?

  default_scope order("updated_at DESC")
  scope :pages_with_content, where("content IS NOT NULL and content != ''")
  scope :pages_with_external, where("external_link IS NOT NULL and external_link != ''")

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def self.home
    Page.find_by_is_index(true)
  end

  private

  def change_index
    p = Page.home
    p.update_attribute(:is_index, false) if p
  end

  def external_link_only
    if self.content?
      errors.add(:content, "not allowed if an external URL is specified.")
    end
  end
end
