module Sonicliving
  class Location
    include Base
  
    attr_accessor :location_id
    attr_accessor :latitude
    attr_accessor :longitude
    attr_accessor :city
    attr_accessor :state
    attr_accessor :country
    attr_accessor :timezone
    attr_accessor :gmt_offset
  end
end