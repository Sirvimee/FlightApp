import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { FlightListComponent } from './components/flight-list/flight-list.component';
import { SeatSelectionComponent } from './components/seat-selection/seat-selection.component';

const routes: Routes = [
  { path: '', redirectTo: '/flights', pathMatch: 'full' }, 
  { path: 'flights', component: FlightListComponent },
  { path: 'seats/:flightId', component: SeatSelectionComponent },
  { path: 'flight-list', component: FlightListComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
