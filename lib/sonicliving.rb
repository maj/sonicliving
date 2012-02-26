require "sonicliving/version"
require "sonicliving/base"
require "sonicliving/event"
require "sonicliving/performer"
require "sonicliving/venue"

require "httparty"

module Sonicliving
  class NotFound < StandardError; end
  class ServerError < StandardError; end
  
  class << self
    
    @@api_key = nil
    
    API_URL = "http://api.sonicliving.com/v2"
    
    def configure( api_key )
      @@api_key = api_key
    end
    
    def event_get( options = {} )
      raw_event = get_from_sonic_living( "event/get", options )
      raise NotFound unless raw_event
      Event.new( raw_event.first )  
    end

    def performer_recognize( name )
      raw_performers = get_from_sonic_living( "performer/recognize", :search => name )
      raise NotFound unless raw_performers
      raw_performers.map{ |raw_performer| Performer.new( raw_performer ) }
    end
    
    def performer_upcoming( performer_id )
      raw_events = get_from_sonic_living( "performer/upcoming", :performer_id => performer_id )
      raise NotFound unless raw_events
      raw_events.map{ |raw_event| Event.new( raw_event ) }
    end
    
    def location_locate( options = {} )
      raw_locations = get_from_sonic_living( "location/locate", options )
      raise NotFound unless raw_locations
      raw_locations.map{ |raw_location| Location.new( raw_location) }
    end

    def venue_upcoming ( venue_id )
      raw_events = get_from_sonic_living( "venue/upcoming", :venue_id => venue_id )
      raise NotFound unless raw_events
      raw_events.map{ |raw_event| Event.new( raw_event) }      
    end

    def venue_recognize( name )
      raw_venues = get_from_sonic_living( "venue/recognize", :search => name )
      raise NotFound unless raw_venues
      raw_venues.map{ |raw_venue| Venue.new( raw_venue ) }
    end
    
    def venue_get( venue_id )
      raw_venue = get_from_sonic_living( "venue/get", :venue_id => venue_id )
      raise NotFound unless raw_venue
      Venue.new( raw_venue.first )  
    end
  
    protected
  
    def get_from_sonic_living( endpoint, query )
      raise ArgumentError.new( "No API key set, call SonicLiving.configure( API_KEY ) first") unless @@api_key

      url = API_URL + "/" + endpoint
      response = HTTParty.get( url, :query => { :key => @@api_key }.merge( query ))
      raise ServerError.new( "There was an error communicating with the server: #{response.inspect}") unless response.code == 200

      return response["data"] 
    end
  end
end
