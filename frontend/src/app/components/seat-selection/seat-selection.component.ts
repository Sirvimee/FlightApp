import { Component, Input, OnInit, ChangeDetectorRef } from '@angular/core';
import { SeatService } from '../../services/seat.service';
import { ReservationService } from '../../services/reservation.service';

@Component({
  selector: 'app-seat-selection',
  templateUrl: './seat-selection.component.html',
  styleUrls: ['./seat-selection.component.css']
})
export class SeatSelectionComponent implements OnInit {
  @Input() airline!: number;
  seats: any[] = [];
  firstClassSeats: any[] = [];
  businessClassSeats: any[] = [];
  economyClassSeats: any[] = [];
  passengerName = '';

  constructor(
    private seatService: SeatService,
    private reservationService: ReservationService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit(): void {
    this.seatService.getSeatsForFlight(this.airline).subscribe(data => {
      this.seats = data;
      this.processSeatChart();
      this.cdr.detectChanges(); // Käivita muutuste tuvastamine pärast andmete laadimist
    });
  }

  bookSeat(seatId: number) {
    this.reservationService.bookSeats(this.airline, this.passengerName, 1).subscribe(() => {
      alert('Broneeritud!');
      this.ngOnInit();
    });
  }

  getSeatClass(seat: any): string {
    let classes = seat.available ? 'available-seat ' : 'unavailable-seat ';
    if (seat.extraLegroom) {
      classes += 'extra-legroom ';
    }
    if (seat.exitRow) {
      classes += 'exit-row ';
    }
    return classes.trim();
  }

  selectSeat(seat: any): void {
    if (seat.available) {
      seat.available = false;
      alert(`Iste ${seat.seatNumber} on broneeritud`);
    } else {
      alert(`Iste ${seat.seatNumber} pole saadaval`);
    }
  }

  private processSeatChart(): void {
    this.firstClassSeats = this.seats.filter(seat => seat.seatClass === 'FIRST_CLASS');
    this.businessClassSeats = this.seats.filter(seat => seat.seatClass === 'BUSINESS');
    this.economyClassSeats = this.seats.filter(seat => seat.seatClass === 'ECONOMY');
  }

  chunkArray(myArray: any[], chunk_size: number): any[][] {
    const results = [];
    const arrayCopy = myArray.slice(); // Loo massiivi koopia
    while (arrayCopy.length) {
      results.push(arrayCopy.splice(0, chunk_size));
    }
    return results;
  }
}