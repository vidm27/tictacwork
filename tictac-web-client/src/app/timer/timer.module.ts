import { NgModule } from "@angular/core";
import { AddTaskTimerComponent } from "./components/add-task-timer/add-task-timer.component";
import { ListTaskComponent } from "./components/list-task/list-task.component";
import { CommonModule } from "@angular/common";

@NgModule({
  declarations: [
    AddTaskTimerComponent,
    ListTaskComponent
  ],
  exports: [
    ListTaskComponent, AddTaskTimerComponent
  ],
  imports: [
    CommonModule
  ],
})
export class TimerTaskModule{}
