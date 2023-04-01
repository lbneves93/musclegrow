import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  constructor() {
    super();
    this.exercisesOfWeek = [];
    this.exercisesOfDay = [];
    this.currentDay = 0;
  }

  loadExecisesChecked() {
    this.cleanAllChecks();
    this.currentDay = parseInt(localStorage.getItem('weekday'));
    this.exercisesOfWeek = JSON.parse(localStorage.getItem('exercisesOfWeek'));
    this.exercisesOfDay = this.exercisesOfWeek[this.currentDay];
    this.exercisesOfDay.forEach((exercise) => {
      document.getElementById(`exercise-${exercise.name.toLowerCase().replaceAll(' ', '-')}`).checked = true;
    })
  }

  changeCheckExercise(event) {
    let exerciseChecked = event.target.id.split('exercise-')[1];
    let exerciseName = exerciseChecked.capitalize('-');
    
    if(event.target.checked == true) {
      let exerciseUrl = document.getElementById(`img-url-${exerciseChecked}`).dataset.url;
      this.exercisesOfDay.push({ 'name': exerciseName, 'url': exerciseUrl });
    } 
    else {
      let indexToRemove = this.exercisesOfDay.findIndex(item => item.name === exerciseName);
      this.exercisesOfDay.splice(indexToRemove, 1)
    }
  }

  save() {
    this.exercisesOfWeek[this.exercisesOfDay] = this.exercisesOfDay;
    localStorage.setItem('exercisesOfWeek', JSON.stringify(this.exercisesOfWeek));
    document.getElementById(`exercises-list-names-${this.currentDay}`).value = JSON.stringify(this.exercisesOfDay.map(item => item.name));
    document.getElementById(`block-exercises-${this.currentDay}`).querySelectorAll(".exercise-card").forEach(el => el.remove());
    let spanNoExercises = document.querySelector(`#no-exercises-${this.currentDay}`);
    spanNoExercises ? spanNoExercises.remove() : false;
    
    if(this.exercisesOfDay.length < 1) {
      let noExercisesHtml = `<span id="no-exercises-${this.currentDay}" class="col-md-12 mb-4 without-exercises">
                              Not exercises today.
                            </span>`;

      document.getElementById(`block-exercises-${this.currentDay}`).innerHTML += noExercisesHtml;
    } 
    else {
      this.exercisesOfDay.forEach((exercise) => {
        let exerciseCardHtml = `<div class="exercise-card">
                                  <div class="exercise-name" data-day="${this.currentDay}" data-name="${exercise.name}" data-url="${exercise.url}">
                                    ${exercise.name}
                                  </div>
                                  <div><img style="width: 15vw; height: 15vh" src="${exercise.url}"></img></div>
                              </div>` 
        
        document.getElementById(`block-exercises-${this.currentDay}`).innerHTML += exerciseCardHtml;
      })
    }  
  }

  cleanAllChecks() {
    document.querySelectorAll('input[name=exercise-checkbox]:checked').forEach(el => el.checked = false);
  }
}