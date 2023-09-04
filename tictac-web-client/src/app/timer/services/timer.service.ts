import { Injectable } from '@angular/core';
import { TaskTimer } from '../interfaces/task.interface';
import { v4 as uuid } from 'uuid';

@Injectable({
  providedIn: 'root'
})
export class TimerService {

  public tasksTimer: TaskTimer[] = []

  constructor() { }

  onNewTask(task: TaskTimer){
    const newTask: TaskTimer = {
      ...task,
      id: uuid()
    }
    this.tasksTimer.push(newTask)
  }


}
