import { Component, OnInit, AfterViewInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-challenges',
  templateUrl: './challenges.component.html',
  styleUrls: ['./challenges.component.sass']
})
export class ChallengesComponent implements OnInit, AfterViewInit {
  challengesTableColumns: string[] = ["no", "name", "difficulty", "status"];
  tableData = new MatTableDataSource<ChallengesTable>(allChallenges);

  allTags = ["DFS", "BFS"];

  @ViewChild(MatPaginator) paginator: MatPaginator | null = null;
  @ViewChild(MatSort) sort: MatSort | null = null;

  constructor() { }

  ngAfterViewInit(): void {
    this.tableData.paginator = this.paginator;
    this.tableData.sort = this.sort;
  }

  ngOnInit(): void {
  }
}

export interface ChallengesTable {
  no: number;
  name: string;
  difficulty: "HARD" | "MEDIUM" | "EASY";
  status: "ACCEPTED" | "Compilation Error" | "TLE" | "WRONG ANSWER";
}

const allChallenges: ChallengesTable[] = [
  { no: 1, name: "Sum of 2 numbers", difficulty: "EASY", status: "ACCEPTED" },
  { no: 2, name: "Maximum element", difficulty: "MEDIUM", status: "WRONG ANSWER" },
  { no: 3, name: "Median of Two Sorted Arrays", difficulty: "HARD", status: "TLE" },
  { no: 4, name: "Maximum element", difficulty: "EASY", status: "TLE" },
  { no: 5, name: "Reverse Integer", difficulty: "HARD", status: "Compilation Error" },
  { no: 6, name: "Generate Parentheses", difficulty: "HARD", status: "Compilation Error" },
  { no: 7, name: "Remove Element", difficulty: "HARD", status: "ACCEPTED" },
  { no: 8, name: "Next Permutation", difficulty: "EASY", status: "WRONG ANSWER" },
];
