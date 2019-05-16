require 'uri'

module UrlValidation
  extend ActiveSupport::Concern

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
