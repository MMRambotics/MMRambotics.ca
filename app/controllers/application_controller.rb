class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :get_postings
  before_filter :new_feedback

  def get_postings
    @news = Posting.news
    @events = Posting.events
    @team_notices = Posting.team_notices
  end

  def new_feedback
    @new_feedback = Feedback.new
  end
end
