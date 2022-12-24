import { Component, OnInit, AfterViewInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';
import { MatSort } from '@angular/material/sort';
import { ChartConfiguration, ChartData, ChartType } from 'chart.js';
import { BaseChartDirective } from 'ng2-charts';

@Component({
  selector: 'app-individual-assignment',
  templateUrl: './individual-assignment.component.html',
  styleUrls: ['./individual-assignment.component.sass']
})
export class IndividualAssignmentComponent implements OnInit, AfterViewInit {
  challengesTableColumns: string[] = ["no", "name", "difficulty", "status"];
  tableData = new MatTableDataSource<ChallengesTable>(allChallenges);

  @ViewChild(MatPaginator) paginator: MatPaginator | null = null;
  @ViewChild(MatSort) sort: MatSort | null = null;
  @ViewChild(BaseChartDirective) chart: BaseChartDirective | null = null;

  public chartOptions: ChartConfiguration['options'] = {
    responsive: true
  }

  public chartType: ChartType = 'bar';

  public chartData: ChartData<'bar'> = {
    labels: ['0-1', '2-3', '4-5', '6-7'],
    datasets: [
      { data: [5, 2, 10, 5], label: "Number of members" }
    ]
  }

  constructor() { }

  ngOnInit(): void {
  }

  ngAfterViewInit(): void {
    this.tableData.paginator = this.paginator;
    this.tableData.sort = this.sort;
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
  { no: 2, name: "Maximum element", difficulty: "MEDIUM", status: "TLE" }
];
