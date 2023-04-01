import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  constructor() {
    super();
    this.exercisesOfWeek = [];
  }

  connect() {
    for (let i = 0; i < 7; i++) {
      let exercisesOfDay = Array.from(document.querySelectorAll(`[data-day="${i}"]`));
      this.exercisesOfWeek[i] = exercisesOfDay.map((element) => { return { "name": element.dataset.name, "url": element.dataset.url } })
      localStorage.setItem('exercisesOfWeek', JSON.stringify(this.exercisesOfWeek));
    }   
  }

  setCurrentWeekDay(event) {
    localStorage.setItem('weekday', event.target.id)
  }
}
