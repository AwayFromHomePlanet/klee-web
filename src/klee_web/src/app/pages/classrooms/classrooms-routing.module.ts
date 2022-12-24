import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ClassroomsComponent } from './classrooms.component';
import { IndividualAssignmentComponent } from './individual-assignment/individual-assignment.component';
import { SpecifiedClassroomComponent } from './specified-classroom/specified-classroom.component';

const routes: Routes = [{ path: '', component: ClassroomsComponent },
{ path: 'testClass', component: SpecifiedClassroomComponent },
{ path: 'assignment/testAssignment', component: IndividualAssignmentComponent }];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ClassroomsRoutingModule { }
