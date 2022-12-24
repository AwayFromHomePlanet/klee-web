import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-classrooms',
  templateUrl: './classrooms.component.html',
  styleUrls: ['./classrooms.component.sass']
})
export class ClassroomsComponent implements OnInit {
  allClassrooms = [{ "ClassroomName": "Graphs" }, { "ClassroomName": "Arrays" },
  { "ClassroomName": "Binary Search" }, { "ClassroomName": "Geometry" }, { "ClassroomName": "Algorithms" }];
  
  transitionBackgrounds = [{ "from": "from-teal-200", "to": "to-teal-400" }, { "from": "from-sky-200", "to": "to-sky-400" },
  { "from": "from-indigo-200", "to": "to-indigo-400" }, { "from": "from-emerald-300", "to": "to-emerald-500" },
  { "from": "from-indigo-300", "to": "to-indigo-500" }, { "from": "from-sky-300", "to": "to-sky-500" }];

  constructor() { }

  ngOnInit(): void {
  }

  backgroundIndex = -1;
  getBackgroundColorFrom() {
    this.backgroundIndex++;
    if (this.backgroundIndex == this.transitionBackgrounds.length) {
      this.backgroundIndex = 0;
    }

    return this.transitionBackgrounds[this.backgroundIndex].from;
  }

  getBackgroundColorTo() {
    return this.transitionBackgrounds[this.backgroundIndex].to;
  }
}
