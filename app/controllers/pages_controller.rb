class PagesController < ApplicationController
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
end
