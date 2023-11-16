import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="hamburger"
export default class extends Controller {
  static targets = ["hamburger", "mobileNav"]

  connect() {
    console.log("Hello")
  }

  fire () {
    this.hamburgerTarget.classList.toggle('is-active');
    this.mobileNavTarget.classList.toggle('is-active');
  }

}
