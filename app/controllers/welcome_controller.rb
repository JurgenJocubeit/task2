require 'uri'

class WelcomeController < ApplicationController
  def index
    # Use the cronuts_url parameter as the cronuts link if the param is available
    @cronuts_url = validate_url(welcome_params[:cronuts_url]) ||
      URI.escape('https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%' \
        'AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg')

    # Use the donuts_url parameter as the donuts link if the param is available
    @donuts_url = validate_url(welcome_params[:donuts_url]) ||
      URI.escape('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg' \
        '/250px-Glazed-Donut.jpg')
  end

  private

  # Only permit whitelisted params.
  def welcome_params
    params.permit(:cronuts_url, :donuts_url)
  end

  # Test for valid URL - defaults back to system urls in invalid.
  def validate_url(url_param)
    if url_param
      escaped_uri = url_param ? URI.escape(url_param) : nil
      uri = URI.parse(escaped_uri)
      scheme = uri && uri.scheme

      # Must be a http or https scheme, don't accept ftp, file, mailto etc.
      if scheme && %w[http https].include?(scheme)
        return escaped_uri
      end
    end

    nil # do nothing but don't kill the request
  rescue URI::InvalidURIError
    nil # do nothing but don't kill the request
  end
end
