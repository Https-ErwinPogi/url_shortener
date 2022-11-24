class LinksController < ApplicationController
  before_action :authenticate_user!

  def show
    link = Link.find_by(lookup_code: params[:lookup_code])
    redirect_to link.original_url, allow_other_host: true
  end

  def create
    shortener = Shortener.new(link_params[:original_url])
    @link = shortener.generate_short_link
    @link.user = current_user
    if Rails.env.development?
      @link.ip_address = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
       @link.user_agent = request.env["HTTP_USER_AGENT"]
    else
      @link.ip_address = request.remote_ip
      @link.user_agent = request.user_agent
    end
    if @link.save
      flash[:notice] = "Short Url was created successfully."
      redirect_back(fallback_location: root_path)
    else
      not_found
    end
  end

  private

  def link_params
    params.require(:link).permit(:original_url)
  end
end