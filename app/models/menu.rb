class Menu < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :pages

  scope :ordered, order("priority DESC, title")

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
