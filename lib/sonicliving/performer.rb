module Sonicliving
  class Performer
    include Base
  
    attr_accessor :performer_id
    attr_accessor  :name
    attr_accessor :itms_artist_id
    attr_accessor :amg_artist_id
    attr_accessor :amg_video_artist_id
    attr_accessor :wl_title_id
    attr_accessor :wl_freebase_id
    attr_accessor :freebase_id
    attr_accessor :freebase_name
    attr_accessor :freebase_guid
    attr_accessor :genres
    attr_accessor :image_id
    attr_accessor :image_attrib
    attr_accessor :article_id
    attr_accessor :article_attrib
    attr_accessor :article_text
    attr_accessor :date_created
  end
end