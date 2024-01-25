import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";



// Connects to data-controller="flatpcikr"
export default class extends Controller {
  connect() {

    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "F j, Y H:i K",
      defaultDate: "today",
      minuteIncrement: 30,



    })
  }
}
