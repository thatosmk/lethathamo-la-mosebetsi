import { render } from 'react-dom'
import  h  from 'components/htm_create_element'
import Boards from 'components/boards'
import Header from 'components/header'

render(
  h`
     <${Header} title='Trello Clone Project' //>
    <${Boards} id=${1} title='The Pizza Project' //>
  `,
  document.getElementById('app')
)
