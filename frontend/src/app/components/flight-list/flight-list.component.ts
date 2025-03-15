import { Component, OnInit } from '@angular/core';
import { FlightService } from '../../services/flight.service';
import { Flight } from '../../model/flight';

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
  selectedPassengerCount: number = 0;

  filters = {
    destination: '',
    date: '',
    departureTime: '',
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
    this.selectedFlight = flight;
    this.filteredFlights = this.filteredFlights.filter(f => f.id === flight.id);
    this.selectedPassengerCount = this.selectedPassengerCount;
  }

  clearFlightSelection() {
    this.selectedFlightId = null; 
    this.selectedPassengerCount = 0;
    this.clearFilters(); 
  }

  applyFilters() {
    this.filteredFlights = this.filteredFlights.filter(flight => {
      return (
        (!this.filters.destination || 
          flight.destination.toLowerCase().includes(this.filters.destination.toLowerCase())) &&
          
        (!this.filters.date || 
          flight.date === this.filters.date) &&
          
        (!this.filters.departureTime || 
          flight.departureTime === this.filters.departureTime) && 
          
        (!this.filters.price || 
          flight.price <= +this.filters.price)
      );
    });
  }

  clearFilters() {
    this.filters = {
      destination: '',
      date: '',
      departureTime: '',
      price: ''
    };
    this.filteredFlights = this.flights;
  }

}