class HomeController < ApplicationController

  def index
    @temperatures = current_temperatures.to_json(:include => :city)
    @last_temperatures = current_last_n_temperatures(2).to_json(:include => :city)
  end

  def update_temperatures
    @result = {
      temperatures: current_temperatures.as_json(:include => :city),
      last_temperatures: current_last_n_temperatures(2).as_json(:include => :city)
    }
    render :json => { status: 402, result: @result }
  end


  private
  	def current_temperatures
      update_or_get_temp
  		Temperature.find_lasts
  	end

    def current_last_n_temperatures(number)
      Temperature.last_n_temperatures(number)
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
