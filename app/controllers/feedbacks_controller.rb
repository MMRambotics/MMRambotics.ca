class FeedbacksController < ApplicationController
  def create
    Feedback.new(params[:feedback].merge({:ip => request.remote_ip})).save
    redirect_to root_path
  end
end
