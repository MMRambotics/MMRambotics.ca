require "net/http"
require "uri"

class Posting < ActiveRecord::Base
  validates_length_of :content, :maximum => 140

  scope :board, order("sticky DESC, max(custom_date, created_at)").limit(5)
  scope :news, where(:category => "News").board
  scope :events, where(:category => "Events").board
  scope :team_notices, where(:category => "Team Notices").board

  def date
    d = self.custom_date.nil? ? created_at.to_date : custom_date.to_date
    buf = d.to_formatted_s(:long)
    buf += " - " + self.end_date.to_date.to_formatted_s(:long) if self.end_date.present?
    buf
  end

  def self.categories
    ["News", "Events", "Team Notices"]
  end

  def self.pull_from_gcalendar!
    url = "http://www.google.com/calendar/feeds/#{Robotics::Application.config.calendar_email}/public/full?v=2"
    data = Hash.from_xml(Net::HTTP.get(URI.parse(url)))
    data["feed"]["entry"].each do |entry|
      # Validate entry
      next unless entry["when"]["startTime"].to_datetime >= DateTime.yesterday
      next unless entry["title"][0] == "*"

      post = Posting.find_by_gcalendar_id(entry["id"])
      post = Posting.new unless post
      post.content = entry["title"][1..-1].strip
      post.custom_date = entry["when"]["startTime"].to_datetime
      post.end_date = entry["when"]["endTime"].to_datetime unless entry["when"]["startTime"].to_date + 1.day == entry["when"]["endTime"].to_date
      post.category = "Team Notices"
      post.gcalendar_id = entry["id"]
      post.save
    end
  end
end
