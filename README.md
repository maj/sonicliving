Sonicliving API V2
=============

A ruby implementation of the Sonicliving API V2. This requires an API key which Sonicliving provides.

Installation
-----------

    gem install sonicliving-0.0.2.gem 

Usage
-----

    require 'sonicliving'

	# Configure API Key
	Sonicliving.configure( YOUR_API_KEY )
	
	# Perform operations
	Sonicliving.venue_recognize("staples center")

Sonicliving always returns array results but the gem will pick the first item if the array only contains one item.

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b my_markup`)
3. Commit your changes (`git commit -am "Added Snarkdown"`)
4. Push to the branch (`git push origin my_markup`)
5. Open a pull request

License
-------
See LICENSE
