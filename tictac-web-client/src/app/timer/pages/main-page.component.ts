import { Component } from '@angular/core';
import { TimerService } from '../services/timer.service';
import { TaskTimer } from '../interfaces/task.interface';

@Component({
  selector: 'app-main-page',
  templateUrl: './main-page.component.html',
})
export class MainPageComponent {
  constructor(private timerService: TimerService) { }

  get tasksTimer(): TaskTimer[] {
    return [...this.timerService.tasksTimer]
  }

  onNewTask(task: TaskTimer) {
    this.timerService.onNewTask(task);
  }
}
