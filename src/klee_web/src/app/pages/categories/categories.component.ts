import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.sass']
})
export class CategoriesComponent implements OnInit {
  allCategories = [{ "CategoryName": "Graphs" , "CategoryDetail" : "Graphs, Depth First Search, Breadth First Search, Spanning Trees"},
   { "CategoryName": "Arrays", "CategoryDetail" : "Arrays, Sorting algorithms, Insertion, Deletion, learn to manipulate arrays" },
  { "CategoryName": "Binary Search" ,"CategoryDetail" : "Binary Search, cut your programming time in half with these tasks"},
   { "CategoryName": "Geometry" , "CategoryDetail" : "Complex geometric challenges to tickle your brain!"},
   { "CategoryName": "Strings" , "CategoryDetail" : "Challenges involving manipulation of strings, characters arrays and Regular Expressions"},
    { "CategoryName": "Algorithms" , "CategoryDetail" : "A variety of programming  challenges ranging from easy to hard!"}];

  transitionBackgrounds = [{ "from": "from-teal-200", "to": "to-teal-400" }, { "from": "from-sky-200", "to": "to-sky-400" },
  { "from": "from-indigo-200", "to": "to-indigo-400" }, { "from": "from-emerald-300", "to": "to-emerald-500" },
  { "from": "from-indigo-300", "to": "to-indigo-500" }, { "from": "from-sky-300", "to": "to-sky-500" }];

  constructor() {
  }

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
