import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "flash" ]
  
  connect() {
    setTimeout(() => { this.flashTarget.style.display = 'flex' }, 1000);
    setTimeout(() => { this.flashTarget.style.display = 'none' }, 10000);
  }
}