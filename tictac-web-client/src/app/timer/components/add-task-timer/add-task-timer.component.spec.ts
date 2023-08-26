import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddTaskTimerComponent } from './add-task-timer.component';

describe('AddTaskTimerComponent', () => {
  let component: AddTaskTimerComponent;
  let fixture: ComponentFixture<AddTaskTimerComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AddTaskTimerComponent]
    });
    fixture = TestBed.createComponent(AddTaskTimerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
