import { Component, Input, OnInit } from '@angular/core';
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
  seatmap: any[] = [];
  passengerName = '';

  constructor(private seatService: SeatService, private reservationService: ReservationService) {}

  ngOnInit(): void {
    this.seatService.getSeatsForFlight(this.airline).subscribe(data => {
      this.seats = data;
      this.processSeatChart();
    });
  }

  bookSeat(seatId: number) {
    this.reservationService.bookSeats(this.airline, this.passengerName, 1).subscribe(() => {
      alert('Broneeritud!');
      this.ngOnInit();
    });
  }

  getSeatClass(seat: any): string {
    return seat.available ? 'available-seat' : 'unavailable-seat';
  }

  selectSeat(seat: any): void {
    if (seat.available) {
      seat.available = false;
      alert(`Seat ${seat.seatNumber} selected`);
    } else {
      seat.available = true;
      alert(`Seat ${seat.seatNumber} deselected`);
    }
  }

  private processSeatChart(): void {
    const classOrder = ['BUSINESS', 'FIRST_CLASS', 'ECONOMY'];
    this.seats.sort((a, b) => classOrder.indexOf(a.seatClass) - classOrder.indexOf(b.seatClass));

    this.seatmap = []; // Tühjendame seatmap enne uue kaardi loomist
    let currentRow: any[] = [];
    let currentClass = '';

    this.seats.forEach((seat, index) => {
      if (seat.seatClass !== currentClass) {
        if (currentRow.length > 0) {
          this.seatmap.push({ class: currentClass, seats: this.formatRow(currentRow) });
          currentRow = [];
        }
        currentClass = seat.seatClass;
      }

      currentRow.push(seat);

      if (currentRow.length === 4) {
        this.seatmap.push({ class: currentClass, seats: this.formatRow(currentRow) });
        currentRow = [];
      }
    });

    if (currentRow.length > 0) {
      this.seatmap.push({ class: currentClass, seats: this.formatRow(currentRow) });
    }
  }

  private formatRow(row: any[]): any[] {
    const formattedRow = [];
    for (let i = 0; i < row.length; i += 2) {
      formattedRow.push([row[i], row[i + 1] || null]);
    }
    return formattedRow;
  }
}