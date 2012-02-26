module Sonicliving
  class << self
    def event_get( options = {} )
      get_and_map( Event, __method__, options )
    end

    def event_popular( sort = "" )
      get_and_map( Event, __method__, sort )
    end

    def event_popular_by_ip( options )
      get_and_map( Event, __method__, options )
    end

    def event_ursvp( event_id )
      get_and_map( Event, __method__, event_id )
    end

    def performer_get( options )
      get_and_map( Performer, __method__,  options )
    end

    def performer_recognize( name )
      get_and_map( Performer, __method__,  :search => name )
    end

    def performer_search( options )
      get_and_map( Performer, __method__,  options )
    end

    def performer_upcoming( performer_id )
      get_and_map( Event, __method__, :performer_id => performer_id )
    end

    def location_locate( options = {} )
      get_and_map( Location, __method__, options )
    end

    def location_recognize( name )
      get_and_map( Location, __method__, :search => name )
    end

    def venue_get( venue_id )
      get_and_map( Venue, __method__,  :venue_id => venue_id )  
    end

    def venue_lookup( options )
      get_and_map( Venue, __method__,  options )  
    end

    def venue_recognize( name )
      get_and_map( Venue, __method__, :search => name )
    end

    def venue_upcoming ( venue_id )
      get_and_map( Venue, __method__, :venue_id => venue_id )
    end
  
    protected

    def get_and_map( object_class, method_name, query)
      raw_results = get_from_sonic_living( method_name.to_s.sub( "_", "/" ), query )
      raise NotFound unless raw_results

      if raw_results.size == 1
        object_class.new( raw_results.first )  
      else
        raw_results.map{ |raw_result| object_class.new( raw_result ) }
      end
    end

    def get_from_sonic_living( endpoint, query )
      raise ArgumentError.new( "No API key set, call SonicLiving.configure( API_KEY ) first") unless @@api_key

      url = API_URL + "/" + endpoint
      response = HTTParty.get( url, :query => { :key => @@api_key }.merge( query ))
      raise ServerError.new( "There was an error communicating with the server: #{response.inspect}") unless response.code == 200

      return response["data"] 
    end
  end
end