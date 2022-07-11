import { Component } from 'react'
import  h  from 'components/htm_create_element'
import Header from 'components/header'


export default class Board extends Component {

  constructor(props) {
    super(props)
    this.state = { board: []}
  }

  componentDidMount() {
    axios.get(`http://localhost:3005/boards/${this.props.id}.json`, {
      headers: { 'Content-Type': 'application/json' }
    })
      .then((res) => {
        this.setState({ board: res.data })
      })
      .catch((err) => {
        console.log(err)
      })
  }
  render() {
    return h`
      <${Header} title=${this.props.title} //>
      <section class="main-layout">
        <a href="/" class="link" >Back</a>
      </section>
    `,
    document.getElementById('app')
  }

}
