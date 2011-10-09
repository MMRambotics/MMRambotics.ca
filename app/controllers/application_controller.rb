class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_postings

  def get_postings
    @news = Posting.news
    @events = Posting.events
    @team_notices = Posting.team_notices
  end
end
