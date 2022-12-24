import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CodingComponent } from './coding.component';
import { CodingRoutingModule } from './coding-routing.module';
import { CodemirrorModule } from '@ctrl/ngx-codemirror';
import { FormsModule } from '@angular/forms';
import { MatIconModule } from '@angular/material/icon';
import { MatTabsModule } from '@angular/material/tabs';
import { MatTableModule } from '@angular/material/table';

@NgModule({
  declarations: [
    CodingComponent
  ],
  imports: [
    CommonModule,
    CodingRoutingModule,
    CodemirrorModule,
    FormsModule,
    MatIconModule,
    MatTabsModule,
    MatTableModule
  ]
})
export class CodingModule { }
