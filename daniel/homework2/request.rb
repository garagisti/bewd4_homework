# SDP: Good use of a class
class Request

  attr_accessor :name,
                :location,
                :rankby,
                :api_key
  attr_accessor :type

  def initialize(location,rankby,api_key)
    @location = location
    @rankby   = rankby
    @type     = ''
    @api_key  = api_key
  end

  # Build query URL from user inputs
  def build_url(location,rankby,type,api_key)
    build_location = 'location=' + @location
    build_rankby = '&rankby=' + @rankby
    build_type = '&type=' + @type
    build_api = '&key=' + @api_key
    # SDP Would have been better to use String interpolation here
    url = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?' + build_location + build_rankby + build_type + build_api
  end

  def build_place_hash(name,street)
    # SDP: The new hash notation is a little bit more elegant
    { :name => name, :street => street }
  end

  # SDP: Nice function
  def process_places(places, url)
    data = RestClient::Request.execute(url: url, method: :get, verify_ssl: false)
    json_data = JSON.parse(data)
    results = json_data['results']
    results.each do |place|
      # Specify data needed from json data
      # SDP: Better if these two lines was just done in one line
      place_hash = build_place_hash(place['name'],place['vicinity'])
      places << place_hash
    end
  end

  def show_places(places)
    places.each do |place|
      puts "Name: #{place[:name]}, Address: #{place[:street]}"
    end
  end

end
