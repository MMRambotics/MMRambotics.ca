class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id].to_i)
  end

  def index
    @albums = Album.all
  end
end
