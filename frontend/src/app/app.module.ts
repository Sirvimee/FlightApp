import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { HTTP_INTERCEPTORS, HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';

import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlightListComponent } from './components/flight-list/flight-list.component';
import { SeatSelectionComponent } from './components/seat-selection/seat-selection.component';
import { FlightService } from './services/flight.service';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AuthInterceptor } from './auth/services/auth.interceptor';
import { RegisterComponent } from './auth/register/register.component';
import { LoginComponent } from './auth/login/login.component';
import { ReservationsListComponent } from './reservations-list/reservations-list.component';

@NgModule({
  declarations: [
    AppComponent,
    FlightListComponent,
    SeatSelectionComponent,
    RegisterComponent,
    LoginComponent,
    ReservationsListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    CommonModule,
    ReactiveFormsModule
  ],
providers: [
  FlightService,
  { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true }
],
  bootstrap: [AppComponent]
})
export class AppModule { }
