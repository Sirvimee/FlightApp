import { Component, OnInit } from '@angular/core';
import { ReservationService } from '../services/reservation.service';
import { User } from '../model/user';

@Component({
  selector: 'app-reservations-list',
  templateUrl: './reservations-list.component.html',
  styleUrls: ['./reservations-list.component.css'],
})
export class ReservationsListComponent implements OnInit {
  reservations: any[] = [];
  tableRows: {
    id: number;
    date: string;
    airline: string;
    arrivalAirport: string;
    departureTime: string;
    arrivalTime: string;
    seatNumbers: string;
  }[] = [];
  user: User = JSON.parse(localStorage.getItem('user') || '{}');

  constructor(private reservationService: ReservationService) {}

  ngOnInit(): void {
    this.reservationService.getReservationsByUserId(this.user.id).subscribe({
      next: (reservations) => {
        this.reservations = reservations;
        this.tableRows = this.reservations.map((res) => {
          const flight = res.flightInfo;
          return {
            id: res.id,
            date: flight?.date ?? '',
            airline: flight?.airline ?? '',
            arrivalAirport: flight?.arrivalAirport ?? '',
            departureTime: flight?.departureTime ?? '',
            arrivalTime: flight?.arrivalTime ?? '',
            seatNumbers: res.reservationSeats
              .map((s: any) => s.flightSeat.seatNumber)
              .join(', '),
          };
        });
      },
      error: (err) => {
        console.error('Viga reserveeringute laadimisel:', err);
      },
    });
  }

  cancelReservation(id: number) {
    this.reservationService.cancelReservation(id).subscribe({
      next: () => {
        alert(`Broneering on tühistatud!`);
        this.ngOnInit();
      },
      error: err => {
        console.error('Viga broneeringu tühistamisel:', err);
        alert('Broneeringu tühistamisel tekkis viga, proovige uuesti.');
      }
    });
  }

}
