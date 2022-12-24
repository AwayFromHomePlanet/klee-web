import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ClassroomsRoutingModule } from './classrooms-routing.module';
import { ClassroomsComponent } from './classrooms.component';

import { MatProgressSpinnerModule } from "@angular/material/progress-spinner";
import { MatIconModule } from '@angular/material/icon';
import { SpecifiedClassroomComponent } from './specified-classroom/specified-classroom.component';
import { IndividualAssignmentComponent } from './individual-assignment/individual-assignment.component';

import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSortModule } from '@angular/material/sort';
import { MatExpansionModule } from "@angular/material/expansion";
import { NgChartsModule } from 'ng2-charts';

@NgModule({
  declarations: [
    ClassroomsComponent,
    SpecifiedClassroomComponent,
    IndividualAssignmentComponent
  ],
  imports: [
    CommonModule,
    ClassroomsRoutingModule,
    MatIconModule,
    MatProgressSpinnerModule,
    MatTableModule,
    MatPaginatorModule,
    MatSortModule,
    MatExpansionModule,
    NgChartsModule
  ]
})
export class ClassroomsModule { }
