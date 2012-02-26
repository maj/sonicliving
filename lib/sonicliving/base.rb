module Sonicliving
  module Base
    def initialize( attributes = {} )
      attributes.each do |key, value|
        if respond_to?( "#{key.to_sym}=" )
          send("#{key.to_sym}=", value) 
        end
      end
    end
  end
end