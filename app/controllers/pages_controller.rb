class PagesController < ApplicationController
  def index
    respond_to do |f|
      f.html
      f.xml
    end
  end

  def show
    @page = Page.find(params[:id].to_i)
    render_printer_capable
  end

  def home
    @page = Page.find_by_is_index(true)
    render_printer_capable
  end

  private

  def render_printer_capable
    if params[:print].present?
      render :show, :layout => "print"
    else
      render :show
    end
  end
end
