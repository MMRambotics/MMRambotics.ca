class PhotosController < ApplicationController
  def show
    @photo = Photo.find(params[:id].to_i)
  end
end
