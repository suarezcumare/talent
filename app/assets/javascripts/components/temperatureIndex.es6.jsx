class TemperatureIndex extends React.Component  {
  constructor(props){
     super(props)

    this.updateTemperatures = this.updateTemperatures.bind(this)
    this.state = {
      tmps: this.props.temperatures
    }
  }


  render () {
    console.log(this.state.tmps)
    var currentTemperatures = this.state.tmps.map(function(temperature, index) {
      return (
          <tr>
              <td>{temperature.city.name}</td>
              <td>{temperature.temp}</td>
              <td>{temperature.temp_max}</td>
              <td>{temperature.temp_min}</td>
            </tr>
      );
  }.bind(this));


    return <div>
      <div className="container">
        <h2 className="text-center">Temperatures</h2>
        <button type="button" disabled={false} className="pull-right btn btn-success" onClick={this.updateTemperatures}>Update Temperatures </button>            
        
        <table className="table">
          <thead>
            <tr>
              <th>City</th>
              <th> Temp </th>
              <th> Temp Max </th>
              <th> Temp Min </th>
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
    this.setState({tmps: info})
    this.state.tmps = info
    //this.forceUpdate()
  }

}

