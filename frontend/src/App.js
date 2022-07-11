import {useState, useEffect} from 'react';
import './App.css';
import axios from 'axios';


const App = () => {

  const [simpleItems, setSimpleItems] = useState([])

  useEffect(()=>{
    axios.get('http://localhost:3000/api/v1/simple_items').then((res) => {
      setSimpleItems(res.data)
    })
  }, [])
  return (
    <div className="App">
      <h1>Hello World</h1>
      <table>
        <thead>
        <tr>
          <th>Simple Items</th>
        </tr>
        </thead>
        <tbody>
        <tr>
          {
            simpleItems.map((item) => <td>{item.value}</td>)
          }
        </tr>
        </tbody>
      </table>
    </div>
  );
}

export default App;
