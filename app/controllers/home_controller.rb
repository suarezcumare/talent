class HomeController < ApplicationController

  def index
    @temperatures = current_temperatures.to_json(:include => :city)
  end

  def update_temperatures
    render :json => { status: 402, result: current_temperatures.as_json(:include => :city)}
  end


  private
  	def current_temperatures
      update_or_get_temp
  		Temperature.find_lasts
  	end

    def weather_gateway
      @current_weather_gateway = ManagerWeatherMap.new   
    end

    def update_or_get_temp 
      if Temperature.is_update?
        weather_gateway.update
      end
      
    end
end
