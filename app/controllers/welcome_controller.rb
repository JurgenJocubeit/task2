class WelcomeController < ApplicationController
  def index
  	# Use the cronuts_url parameter as the cronuts link if the param is available
  	@cronuts_url = !welcome_params[:cronuts_url].nil? ? welcome_params[:cronuts_url] : "https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg"
  	# Use the donuts_url parameter as the donuts link if the param is available
  	@donuts_url = !welcome_params[:donuts_url].nil? ? welcome_params[:donuts_url] : "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg"
  end

  private

  def welcome_params
    params.permit(:cronuts_url, :donuts_url)
  end
end
