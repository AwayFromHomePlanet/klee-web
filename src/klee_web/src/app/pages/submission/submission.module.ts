import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SubmissionRoutingModule } from './submission-routing.module';
import { SubmissionComponent } from './submission.component';

import {MatExpansionModule} from "@angular/material/expansion";


@NgModule({
  declarations: [
    SubmissionComponent
  ],
  imports: [
    CommonModule,
    SubmissionRoutingModule,
    MatExpansionModule
  ]
})
export class SubmissionModule { }
