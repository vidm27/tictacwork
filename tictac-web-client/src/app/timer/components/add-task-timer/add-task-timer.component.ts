import { Component, EventEmitter, Output } from '@angular/core';
import { TaskTimer } from '../../interfaces/task.interface';
import * as moment from "moment";
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
    const currentTime = moment.now(); // Obtener la hora actual en milisegundos
    if (this.task.momentStart === undefined) {
      this.task.momentStart = currentTime; // Almacenar el tiempo de inicio si es la primera vez
    }
    const elapsedTimeMilliseconds = currentTime - this.task.momentStart; // Calcular la diferencia

    // Crear una duración Moment.js a partir de la diferencia en milisegundos
    const taskDuration = moment.duration(elapsedTimeMilliseconds);

    // Formatear la duración en el formato "HH:mm:ss"
    const formattedTime = moment.utc(taskDuration.asMilliseconds()).format('HH:mm:ss');

    // Actualizar el tiempo transcurrido en tu componente
    this.elapsedTime = formattedTime;

    console.log(formattedTime);
  }

  // private formatTimeSegment(segment: number): string {
  //   return moment.utc(segment.)
  // }

  public stopTime(): void{
    this.task.momentEnd = moment.now()
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
