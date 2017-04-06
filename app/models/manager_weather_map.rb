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
    to_much_temperatures if @api_open_weather['list']
    min_temperature if @api_open_weather['list'].nil?
    
  end

  private

  def to_much_temperatures
    @api_open_weather['list'].each do |wather|
      city = current_city(wather)
      create_temperatures(wather, city) if ! city.nil?
    end
  end

  def min_temperature
    city = current_city(@api_open_weather)
    create_temperatures(@api_open_weather, city) if ! city.nil?
  
  end

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