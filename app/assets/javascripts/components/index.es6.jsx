'use strict';

let temperatureForm = function(){
  return document.getElementById("temperature-index")
}

let allTemperatures = function(){
  return $(temperatureForm()).data('temperatures')
}

let lastTemperatures = function(){
  return $(temperatureForm()).data('last-temperatures')
}



class ManagerTemperature{
  constructor (){
    ReactDOM.render(
      <TemperatureIndex
        temperatures={allTemperatures()}
        lastTemperatures={lastTemperatures()}/>, temperatureForm())
  }
}


$(document).on('ready',function(){
  if( temperatureForm() ){
    new ManagerTemperature()
  }
})

