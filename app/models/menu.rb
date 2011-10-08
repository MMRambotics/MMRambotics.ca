class Menu < ActiveRecord::Base
  validates_uniqueness_of :title
  has_many :pages

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
