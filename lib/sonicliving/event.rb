module Sonicliving
  class Event 
    include Base
  
    attr_accessor :event_id
    attr_accessor :name
    attr_accessor :start_datetime
    attr_accessor :venue_id
    attr_accessor :venue_name
    attr_accessor :venue_city
    attr_accessor :venue_state
    attr_accessor :venue_country
    attr_accessor :event_url
    attr_accessor :rsvp
    attr_accessor :facebook_eid
    attr_accessor :performer_ids
  end
end