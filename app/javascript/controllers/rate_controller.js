import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rate"
export default class extends Controller {
  static targets = ["rateInput"]

  connect() {
    this.oldRate = undefined
  }

  rateStream(e) {
    if (this.oldRate != undefined) {
      this.oldRate.classList.remove("scored")
    }

    e.target.classList.add("scored")
    this.rateInputTarget.value = e.params["score"]
    this.oldRate = e.target
  }
}
