class TemperatureIndex extends React.Component  {
  constructor(props){
     super(props)

    this.updateTemperatures = this.updateTemperatures.bind(this)
    this.state = {
      tmps: this.props.temperatures
    }
  }


  render () {
    //console.log(this.state.tmps)
    var currentTemperatures = this.state.tmps.map(function(temperature) {
      return (
          <tr>
              <td className="text-center">{temperature.city.name}</td>
              <td className="text-center">{temperature.temp.toFixed(2)}</td>
              <td className="text-center">{temperature.temp_max.toFixed(2)}</td>
              <td className="text-center">{temperature.temp_min.toFixed(2)}</td>
            </tr>
      );
  }.bind(this));


    return <div>
      <div className="container">
        <h2 className="text-center">Temperatures</h2>
        <button id="button_update" type="button" disabled={false} className="pull-right btn btn-success" onClick={this.updateTemperatures}>Update Temperatures </button>            
        
        <table className="table ml-1">
          <thead>
            <tr>
              <th className="text-center">City</th>
              <th className="text-center"> Temp ° </th>
              <th className="text-center"> Temp Max ° </th>
              <th className="text-center"> Temp Min ° </th>
            </tr>
          </thead>
          <tbody>
            {currentTemperatures}
          </tbody>
        </table>
      </div>
    </div>
  }


  updateTemperatures(){
    let url = "/update_temperatures"
    let method = "get"
    let current_info = new AjaxHandler(url, method).run();
    let info;
    current_info.done(function(data){
      info = data.result
    })

    setTimeout(function() {
      //document.getElementById('button_update').disabled = true;
    }, 3000);

    this.setState({tmps: info})
    
    

  }

}

