require "sonicliving/version"
require "sonicliving/base"
require "sonicliving/event"
require "httparty"

module Sonicliving
  class NotFound < StandardError; end
    
  class << self
    
    @@api_key = nil
    
    API_URL = "http://api.sonicliving.com/v2"
    
    def configure( api_key )
      @@api_key = api_key
    end
    
    def recognize_performer( name )
      raw_performer = get_from_sonic_living( "performer/recognize", :search => name )
      raise NotFound unless raw_performer
      Performer.new( raw_performer.first )
    end
    
    def location_locate( options = {} )
      raw_locations = get_from_sonic_living( "location/locate", options )
      raise NotFound unless raw_locations
      
      raw_locations.map{ |raw_location| Location.new( raw_location) }
    end
    
    def performer_upcoming( performer_id )
      raw_event = get_from_sonic_living( "performer/upcoming", :performer_id => performer_id )
      raise NotFound unless raw_shows
      
      raw_event.map{ |raw_shows| Event.new( raw_event) }
    end
    
    def event_get( options = {} )
      raw_event = get_from_sonic_living( "event/get", options )
      raise NotFound unless raw_event
      Event.new( raw_event.first )  
    end
    
    def venue_recognize( name )
      raw_venue = get_from_sonic_living( "performer/recognize", :search => name )
      raise NotFound unless raw_venue
      Venue.new( raw_venue.first )
    end
    
    def venue_get( venue_id )
      raw_venue = get_from_sonic_living( "venue/get", :venue_id => venue_id )
      raise NotFound unless raw_venue
      Venue.new( raw_venue.first )  
    end
  
    protected
  
    def get_from_sonic_living( endpoint, query )
      
      raise ArgumentError.new( "No API key set, call SonicLiving.configure( API_KEY ) first") unless @@api_key
      
      begin 
        url = API_URL + "/" + endpoint
        response = HTTParty.get( url, :query => { :key => @@api_key }.merge( query ))
        return response["data"] if response.code == 200
      rescue Exception => e 
        puts "Error getting #{endpoint} w/query: #{query} from sonic living e: #{e.inspect}"
      end
      return nil
    end
  end
end
