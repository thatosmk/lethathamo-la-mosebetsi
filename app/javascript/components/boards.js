import { Component } from 'react'
import axios from 'axios'
import  h  from 'components/htm_create_element'

export default class Boards extends Component {

  constructor(props) {
    super(props)
    this.state = { boards: []}
  }

  componentDidMount() {
    axios.get('http://localhost:3005/boards.json', {
      headers: { 'Content-Type': 'application/json' }
    })
      .then((res) => {
        this.setState({ boards: res.data })
      })
      .catch((err) => {
        console.log(err)
      })
  }

  render() {
    return h`
      <section class="main-layout">
        <ul class="divide-y">
          ${this.state.boards.map((board) => h`
            <li>
              <a href="/boards/${board.id}" class="link">${board.name}</a>
            </li>
          `
          )}
        </ul>
      </section>
    `
  }

}
