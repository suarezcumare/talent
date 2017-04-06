'use strict';

let temperatureForm = function(){
  return document.getElementById("temperature-index")
}

let allTemperatures = function(){
  return $(temperatureForm()).data('temperatures')
}


class ManagerTemperature{
  constructor (){
    ReactDOM.render(
      <TemperatureIndex
        temperatures={allTemperatures()}/>, temperatureForm())
  }
}


$(document).on('ready',function(){
  if( temperatureForm() ){
    new ManagerTemperature()
  }
})

