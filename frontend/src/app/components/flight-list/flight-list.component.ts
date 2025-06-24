import { Component, OnInit } from '@angular/core';
import { FlightService } from '../../services/flight.service';
import { Flight } from 'src/app/model/flight';

@Component({
  selector: 'app-flight-list',
  templateUrl: './flight-list.component.html',
  styleUrls: ['./flight-list.component.css'],
})

export class FlightListComponent implements OnInit {
  flights: Flight[] = [];
  filteredFlights: Flight[] = [];
  selectedFlightId: number | null = 0;
  selectedFlight!: Flight;
  selectedPassengerCount: number = 1;
  selectedSeatClass: string = 'ECONOMY';
  flightIsSelected: boolean = false;

  filters = {
    destination: '',
    date: '',
    departureDate: '',
    price: ''
  };

  constructor(private flightService: FlightService) {}

  ngOnInit(): void {
    this.flightService.getFlights().subscribe({
      next: (data) => {
        this.flights = data;
        this.filteredFlights = this.flights;
      },
      error: (err) => {
        console.error('Viga lendude laadimisel:', err);
      },
    });
  }

  selectFlight(flight: Flight) {
    this.flightIsSelected = true;
    this.selectedFlight = flight;
    this.filteredFlights = this.filteredFlights.filter(f => f.id === flight.id);
    this.selectedPassengerCount = this.selectedPassengerCount;
    this.selectedSeatClass = this.selectedSeatClass;
  }

  clearFlightSelection() {
    this.flightIsSelected = false;
    this.selectedFlightId = null;
    this.selectedPassengerCount = 1;
    this.selectedSeatClass = 'ECONOMY';
    this.clearFilters();
  }

  applyFilters() {
    this.filteredFlights = this.filteredFlights.filter(flight => {
      return (
        (!this.filters.destination ||
          flight.destination.toLowerCase().includes(this.filters.destination.toLowerCase())) &&

        (!this.filters.departureDate ||
          flight.date === this.filters.departureDate) &&

        (!this.filters.price ||
          flight.price <= +this.filters.price)
      );
    });
  }

  clearFilters() {
    this.filters = {
      destination: '',
      date: '',
      departureDate: '',
      price: ''
    };
    this.filteredFlights = this.flights;
  }

}
