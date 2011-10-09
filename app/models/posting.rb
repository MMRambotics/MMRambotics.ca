class Posting < ActiveRecord::Base
  validates_length_of :content, :maximum => 140

  scope :board, order("sticky DESC, custom_date DESC, updated_at DESC").limit(5)
  scope :news, where(:category => "News").board
  scope :events, where(:category => "Events").board
  scope :team_notices, where(:category => "Team Notices").board

  def date
    d = self.custom_date.nil? ? created_at.to_date : custom_date.to_date
    d.to_formatted_s(:long)
  end

  def self.categories
    ["News", "Events", "Team Notices"]
  end
end
