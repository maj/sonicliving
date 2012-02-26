require "sonicliving/version"
require "sonicliving/base"
require "sonicliving/event"
require "sonicliving/performer"
require "sonicliving/venue"
require "sonicliving/operations"

require "httparty"

module Sonicliving
  class NotFound < StandardError; end
  class ServerError < StandardError; end
  
  class << self    
    @@api_key = nil
    
    API_URL = "http://api.sonicliving.com/v2"
    API_VERSION = "2"

    def configure( api_key )
      @@api_key = api_key
    end
  end
end
