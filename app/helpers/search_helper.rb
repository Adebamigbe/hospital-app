module SearchHelper
  def self.search lat, lng
    response = HTTParty.get(URI.encode("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&types=hospital|health|doctor&sensor=false&rankby=distance&key=AIzaSyBoczuh9EiBa-u4TaQKQHV79Fu2D6Pl6X0"))
    puts response["results"]
    return response["results"]
  end
end
