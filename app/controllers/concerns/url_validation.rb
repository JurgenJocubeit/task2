require 'uri'

module UrlValidation
  extend ActiveSupport::Concern

  # Test for valid URL - defaults back to system urls in invalid.
  def validate_url(url_param)
    if url_param
      uri = URI.parse(url_param)
      scheme = uri.scheme if uri

      # Must be a http or https scheme, don't accept ftp, file, mailto etc.
      if scheme && %w[http https].include?(scheme)
        return url_param
      end
    end

    nil # do nothing but don't kill the request
  end
end
