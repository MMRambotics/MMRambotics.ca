class PhotosController < ApplicationController
  respond_to :js

  def show
    @photo = Photo.find(params[:id].to_i)
  end
end
