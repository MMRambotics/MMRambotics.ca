class PagesController < ApplicationController
  before_filter :get_postings

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id].to_i)
  end

  def home
    @page = Page.find_by_is_index(true)
    render :show
  end

  private

  def get_postings
    @news = Posting.news
    @events = Posting.events
    @team_notices = Posting.team_notices
  end
end
