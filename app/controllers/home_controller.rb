class HomeController < ApplicationController
  def new
    @link = Link.new
    @links = Link.includes(:user).all
  end

  def show
    @link = Link.find(params[:id])
    redirect_to @link.original_url, allow_other_host: true
  end
end