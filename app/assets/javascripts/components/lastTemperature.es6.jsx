class LastTemperature extends React.Component  {
  constructor(props){
     super(props)

  }


  render () {
    //console.log(this.state.tmps)
    var currentTemperatures = this.props.lastTemperatures.map(function(temperature) {
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
        <h2 className="text-center">Last Temperatures</h2>          
        
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

}

