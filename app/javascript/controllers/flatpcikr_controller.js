import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";



// Connects to data-controller="flatpcikr"
export default class extends Controller {
  connect() {

    flatpickr(".appointment_date", {
      enableTime: true,
      dateFormat: "F j, Y H:i K",
      defaultDate: "today",
      minDate: "today", // Disable previous dates
      minuteIncrement: 30,
    })

    flatpickr(".birth_date", {
      enableTime: true,
      dateFormat: "F j, Y",
      defaultDate: "today"
    })
  }
}
