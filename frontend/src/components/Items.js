import React, { useEffect, useState } from 'react'
import axios from 'axios'

export default function Items() {
  const [simpleItems, setSimpleItems] = useState([])

  useEffect(()=>{
    axios.get('http://localhost:3000/api/v1/simple_items').then((res) => {
      setSimpleItems(res.data)
    })
  }, [])

  return (
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
  )
}
