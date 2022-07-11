import { Component } from 'react'
import  h  from 'components/htm_create_element'

export default class Boards extends Component {

  render() {
    return h`
      <header class="header">
        <h1 class="h1 text-white">${this.props.title}</h1>
      </header>
    `
  }

}
