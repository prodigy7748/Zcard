import { Controller } from "stimulus"
import ax from 'axios'
export default class extends Controller {
  static targets = [ "link" ]

delete(d){
  d.preventDefault()
    const id = this.data.get('id')
    const token = document.querySelector('[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-TOKEN'] = token
    this.element.style = 'display:none'
  }
}