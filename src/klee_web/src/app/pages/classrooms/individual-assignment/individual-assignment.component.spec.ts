import { ComponentFixture, TestBed } from '@angular/core/testing';

import { IndividualAssignmentComponent } from './individual-assignment.component';

describe('IndividualAssignmentComponent', () => {
  let component: IndividualAssignmentComponent;
  let fixture: ComponentFixture<IndividualAssignmentComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ IndividualAssignmentComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(IndividualAssignmentComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
