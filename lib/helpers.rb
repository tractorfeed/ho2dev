# http://gis.stackexchange.com/a/2980
def get_bounding_box(latitude, longitude, radius)
	earth_radius = 6378137.0
	latitude_offset = radius.to_f / earth_radius
	longitude_offset = radius.to_f / (earth_radius * Math.cos(Math::PI * latitude.to_f / 180))
	
	result = {
		'min_lat' => latitude.to_f  - latitude_offset  * 180 / Math::PI,
		'min_lng' => longitude.to_f - longitude_offset * 180 / Math::PI,
		'max_lat' => latitude.to_f  + latitude_offset  * 180 / Math::PI,
		'max_lng' => longitude.to_f + longitude_offset * 180 / Math::PI
	}
	return result
end


require 'date'
COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
def days_in_month(month, year = Time.now.year)
   return 29 if month == 2 && Date.gregorian_leap?(year)
   COMMON_YEAR_DAYS_IN_MONTH[month]
end