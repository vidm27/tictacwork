import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TimerTaskModule } from './timer/timer.module';
import { MainPageComponent } from './timer/pages/main-page.component';

@NgModule({
  declarations: [
    AppComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    TimerTaskModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
