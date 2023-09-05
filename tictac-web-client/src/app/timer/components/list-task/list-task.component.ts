import { Component, Input } from '@angular/core';
import { TaskTimer } from '../../interfaces/task.interface';
import * as dayjs from "dayjs";


@Component({
  selector: 'app-list-task',
  templateUrl: './list-task.component.html',
  styleUrls: ['./list-task.component.css']
})
export class ListTaskComponent {

  public totalDuration : string ='00:00:00'

  @Input()
  public tasks: TaskTimer[] = [
  ]

  public formatTime(moment: any, duration: boolean = false) {
    if(duration){
      return dayjs().startOf('day').second(moment).format('HH:mm:ss');
    }
    return dayjs(moment).format('HH:mm')
  }

  public sumaDurations(){
    
  }
}
