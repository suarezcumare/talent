class ManagerWeatherMap
  require 'open_weather'

  attr_accessor :message_errors

  def initialize
    @message_errors = ""
    codes = City.find_codes
    options = { units: "metric", APPID: '932fb90a0bffea11b278f28c804b6a89' }
    @api_open_weather = OpenWeather::Current.cities(codes, options)
  
  end

  def update
    @api_open_weather['list'].each do |wather|
      puts "ladrones"
      puts "wather #{wather['id']}"
      city = current_city(wather)
      create_temperatures(wather, city) if ! city.nil?
    end
  end

  private

  def current_city(wather)
    City.find_by(code: wather['id'])
  end

  def create_temperatures(wather, city)
    Temperature.create(temp: wather['main']['temp'], 
      temp_max: wather['main']['temp_max'], 
      temp_min: wather['main']['temp_min'], 
      city_id: city.id)
  end

end