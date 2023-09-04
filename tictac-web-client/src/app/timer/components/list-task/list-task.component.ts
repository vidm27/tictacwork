import { Component, Input } from '@angular/core';
import { TaskTimer } from '../../interfaces/task.interface';
import { utc, Duration, duration, isDuration } from 'moment';


@Component({
  selector: 'app-list-task',
  templateUrl: './list-task.component.html',
  styleUrls: ['./list-task.component.css']
})
export class ListTaskComponent {

  @Input()
  public tasks: TaskTimer[] = [
  ]

  public formatTime(moment: Duration|number, allowSecond: boolean = false) {
    // const newMoment = Math.floor(moment / 1000)



    if (isDuration(moment)){
      return utc(moment.milliseconds()).format('HH:mm:ss')
    }else{
      moment = duration(moment)
      return utc(moment.milliseconds()).format('HH:mm:ss')
    }

    // return÷ utc(moment.milliseconds()).format('HH:mm:ss')
  }
  private formatTimeSegment(segment: number): string {
    return segment < 10 ? `0${segment}` : segment.toString();
  }
}
