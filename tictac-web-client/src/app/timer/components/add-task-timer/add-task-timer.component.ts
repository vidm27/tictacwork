import { Component } from '@angular/core';
import { Task } from '../../interfaces/task.interface';

@Component({
  selector: 'app-add-task-timer',
  templateUrl: './add-task-timer.component.html',
  styleUrls: ['./add-task-timer.component.css']
})
export class AddTaskTimerComponent {

  public isStartTrackingTime: boolean = false;
  public elapsedTime = '00:00:00';

  public task: Task = {
    id: '',
    intervalId: '',
    title: '',
    duration: 0,
  }

  public startTimeTracking(): void{
    this.task.momentStart = new Date().getTime()
    const intervalId = setInterval(() => {
      this.updateTime();
    }, 1000)
    this.task.intervalId = intervalId;
    this.isStartTrackingTime = true;
  }

  private updateTime(): void{
    const currentTime = new Date().getTime()
    if(this.task.momentStart === undefined){
      this.task.momentStart = new Date().getTime()
    }
    console.log(this.task)
    this.task.duration = Math.floor((currentTime - this.task.momentStart)/1000)
    const hours = Math.floor(this.task.duration / 3600);
    const minutes = Math.floor((this.task.duration % 3600) / 60);
    const seconds = this.task.duration % 60;

    this.elapsedTime = `${this.formatTimeSegment(hours)}:${this.formatTimeSegment(minutes)}:${this.formatTimeSegment(seconds)}`;

  }

  private formatTimeSegment(segment: number): string {
    return segment < 10 ? `0${segment}` : segment.toString();
  }

  public stopTime(): void{
    clearInterval(this.task.intervalId);
    this.isStartTrackingTime = false
    this.task =  {
      id: '',
      intervalId: '',
      title: '',
      duration: 0,
    }
    this.elapsedTime = '00:00:00'
  }
}
