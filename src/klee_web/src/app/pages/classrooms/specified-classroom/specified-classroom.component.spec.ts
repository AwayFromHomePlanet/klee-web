import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SpecifiedClassroomComponent } from './specified-classroom.component';

describe('SpecifiedClassroomComponent', () => {
  let component: SpecifiedClassroomComponent;
  let fixture: ComponentFixture<SpecifiedClassroomComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SpecifiedClassroomComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SpecifiedClassroomComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
