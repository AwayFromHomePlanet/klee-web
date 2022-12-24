import { Component, OnInit } from '@angular/core';

export interface Submission {
  id: number;
  time: string;
  status: "ACCEPTED" | "Compilation Error" | "TLE" | "WRONG ANSWER";
}

@Component({
  selector: 'app-coding',
  templateUrl: './coding.component.html',
  styleUrls: ['./coding.component.sass']
})
export class CodingComponent implements OnInit {

  content: string = 'bool isPalindrome (int x) {\n\n}';

  allSubmissions: Submission[] = [
    {id: 3741345, time: '2022/12/01 18:35', status: 'WRONG ANSWER'},
    {id: 3741348, time: '2022/12/01 18:39', status: 'TLE'},
    {id: 3741351, time: '2022/12/01 18:51', status: 'Compilation Error'},
    {id: 3741362, time: '2022/12/01 19:02', status: 'ACCEPTED'}
  ];
  tableColumns: string[] = ['id', 'time', 'status'];

  tabIndex: number = 0;

  submitCode() {
    this.tabIndex = 1;
  }

  constructor() { }

  ngOnInit(): void {
  }

}
