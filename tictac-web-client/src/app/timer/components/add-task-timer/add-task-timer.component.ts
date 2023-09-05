import { Component, EventEmitter, Output } from '@angular/core';
import { TaskTimer } from '../../interfaces/task.interface';
import * as dayjs from "dayjs";
@Component({
  selector: 'app-add-task-timer',
  templateUrl: './add-task-timer.component.html',
  styleUrls: ['./add-task-timer.component.css']
})
export class AddTaskTimerComponent {

  public isStartTrackingTime: boolean = false;
  public elapsedTime = '00:00:00';

  public task: TaskTimer = {
    id: '',
    intervalId: '',
    title: '',
    // duration: 0,
    momentStart: 0,
    momentEnd: 0
  }

  @Output()
  public onNewTask: EventEmitter<TaskTimer> = new EventEmitter()

  public startTimeTracking(): void{
    this.task.momentStart = new Date().getTime()
    const intervalId = setInterval(() => {
      this.updateTime();
    }, 1000)
    this.task.intervalId = intervalId;
    this.isStartTrackingTime = true;
  }

  private updateTime(): void{
    const currentTime = dayjs() // Obtener la hora actual en milisegundos
    if (this.task.momentStart === undefined) {
      this.task.momentStart = currentTime; // Almacenar el tiempo de inicio si es la primera vez
    }
    const elapsedTimeSeconds = currentTime.diff(this.task.momentStart, 'second'); // Calcular la diferencia
    // Formatear la duración en el formato "HH:mm:ss"
    this.task.duration = elapsedTimeSeconds;
    const formattedTime = dayjs().startOf('day').second(elapsedTimeSeconds).format('HH:mm:ss');

    // Actualizar el tiempo transcurrido en tu componente
    this.elapsedTime = formattedTime;

    console.log(formattedTime);
  }

  // private formatTimeSegment(segment: number): string {
  //   return dayjs.utc(segment.)
  // }

  public stopTime(): void{
    this.task.momentEnd = dayjs()
    clearInterval(this.task.intervalId);
    this.isStartTrackingTime = false
    this.onNewTask.emit({...this.task});
    this.task =  {
      id: '',
      intervalId: '',
      title: '',
      // duration: 0,
      momentStart: 0,
      momentEnd: 0
    }
    this.elapsedTime = '00:00:00'
  }

}
