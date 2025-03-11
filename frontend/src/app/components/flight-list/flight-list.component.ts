import { Component, OnInit } from '@angular/core';
import { FlightService } from '../../services/flight.service';
import { DatePipe } from '@angular/common';
import { Flight } from '../../model/flight';

@Component({
  selector: 'app-flight-list',
  templateUrl: './flight-list.component.html',
  styleUrls: ['./flight-list.component.css'],
  providers: [DatePipe]
})
export class FlightListComponent implements OnInit {
  flights: Flight[] = [];
  filteredFlights: Flight[] = [];
  selectedFlightId: number | null = null;

  filters = {
    destination: '',
    date: '',
    departureTime: '',
    price: ''
  };

  constructor(private flightService: FlightService, private datePipe: DatePipe) {}

  ngOnInit(): void {
    this.flightService.getFlights().subscribe((data: Flight[]) => {
      this.flights = data.map(flight => {
        flight.departureTime = this.convertTimeStringToDate(flight.departureTime as unknown as string);
        return flight;
      });
      this.filteredFlights = this.flights; // Uuenda filteredFlights pärast andmete laadimist
    });
  }

  selectFlight(flight: Flight) {
    this.selectedFlightId = 1;
  }

  applyFilters() {
    this.filteredFlights = this.flights.filter(flight => {
      return (!this.filters.destination || flight.destination.toLowerCase().includes(this.filters.destination.toLowerCase())) &&
             (!this.filters.date || flight.date === this.filters.date) &&
             (!this.filters.departureTime || this.datePipe.transform(flight.departureTime, 'HH:mm') === this.filters.departureTime) &&
             (!this.filters.price || flight.price <= +this.filters.price);
    });
  }

  clearFilters() {
    this.filters = {
      destination: '',
      date: '',
      departureTime: '',
      price: ''
    };
    this.applyFilters();
  }

  convertTimeStringToDate(timeString: string): Date {
    const [hours, minutes, seconds] = timeString.split(':').map(Number);
    const date = new Date();
    date.setHours(hours, minutes, seconds, 0);
    return date;
  }
}