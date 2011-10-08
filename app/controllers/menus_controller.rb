class MenusController < ApplicationController
  def show
    @menu = Menu.find(params[:id].to_i)
  end
end
