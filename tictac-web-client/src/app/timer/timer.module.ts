import { NgModule } from "@angular/core";
import { AddTaskTimerComponent } from "./components/add-task-timer/add-task-timer.component";
import { ListTaskComponent } from "./components/list-task/list-task.component";
import { CommonModule } from "@angular/common";
import { MainPageComponent } from './pages/main-page.component';
import { FormsModule } from "@angular/forms";

@NgModule({
  declarations: [
    AddTaskTimerComponent,
    ListTaskComponent,
    MainPageComponent
  ],
  exports: [
    MainPageComponent
  ],
  imports: [
    CommonModule,
    FormsModule
  ],
})
export class TimerTaskModule{}
