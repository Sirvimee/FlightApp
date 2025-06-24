import { Component, Input, OnInit, ChangeDetectorRef } from '@angular/core';
import { SeatService } from '../../services/seat.service';
import { ReservationService } from '../../services/reservation.service';
import { Output, EventEmitter } from '@angular/core';
import { Reservation } from 'src/app/model/reservation';
import { Flight } from 'src/app/model/flight';
import { AppComponent } from 'src/app/app.component';
import { User } from 'src/app/model/user';

@Component({
  selector: 'app-seat-selection',
  templateUrl: './seat-selection.component.html',
  styleUrls: ['./seat-selection.component.css']
})
export class SeatSelectionComponent implements OnInit {
  @Input() flight!: Flight;
  @Input() passengerCount!: number;
  @Input() selectedSeatClass!: string; // 'ECONOMY', 'BUSINESS', 'FIRST_CLASS'
  @Output() back = new EventEmitter<void>();
  seats: any[] = [];
  firstClassSeats: any[] = [];
  businessClassSeats: any[] = [];
  economyClassSeats: any[] = [];
  passengerName = '';
  selectedSeats: number[] = [];
  availableFirstClassSeats: any[] = [];
  availableBusinessClassSeats: any[] = [];
  availableEconomyClassSeats: any[] = [];
  availableSeats: any[] = [];
  isLoggedIn = false;
  isLoading = true;
  user: User = JSON.parse(localStorage.getItem('user') || '{}');

  constructor(
    private seatService: SeatService,
    private reservationService: ReservationService,
    private cdr: ChangeDetectorRef,
    private appComponent: AppComponent,
  ) {this.isLoggedIn = this.appComponent.isLoggedIn; }

  ngOnInit(): void {
    this.isLoading = true;
    this.seatService.getSeatsForFlight(Number(this.flight.id)).subscribe(data => {
      const seenSeatIds = new Set<number>();
      this.seats = data
        .map((s: any) => ({
          ...s.seat,
          available: s.available,
          seat_id: s.seat.id ?? s.seat_id
        }))
        .filter(seat => {
          if (seenSeatIds.has(seat.seat_id)) {
            return false;
          }
          seenSeatIds.add(seat.seat_id);
          return true;
        })
        .sort((a, b) => a.seat_id - b.seat_id);

      this.processSeatChart();

      setTimeout(() => {
        this.selectInitialSeats();
        this.cdr.detectChanges();
        this.isLoading = false;
      }, 100);
    }, error => {
      console.error("Viga istmete laadimisel:", error);
      this.isLoading = false;
    });
  }

  private processSeatChart(): void {
    this.firstClassSeats = this.seats.filter(seat => seat.seatClass === 'FIRST_CLASS');
    this.businessClassSeats = this.seats.filter(seat => seat.seatClass === 'BUSINESS');
    this.economyClassSeats = this.seats.filter(seat => seat.seatClass === 'ECONOMY');

    this.availableSeats = this.seats.filter(seat => seat.available);
    this.availableFirstClassSeats = this.firstClassSeats.filter(seat => seat.available);
    this.availableBusinessClassSeats = this.businessClassSeats.filter(seat => seat.available);
    this.availableEconomyClassSeats = this.economyClassSeats.filter(seat => seat.available);
  }

  selectInitialSeats(): void {
    if (this.selectedSeatClass === 'FIRST_CLASS') {
      this.searchSeats(this.availableFirstClassSeats, 0);
      this.searchSeats(this.availableBusinessClassSeats, 0);
      this.searchSeats(this.availableEconomyClassSeats, 0);
    } else if (this.selectedSeatClass === 'BUSINESS') {
      this.searchSeats(this.availableBusinessClassSeats, 0);
      this.searchSeats(this.availableEconomyClassSeats, 0);
    } else {
      this.searchSeats(this.availableEconomyClassSeats, 0);
    }

    if (this.selectedSeats.length < this.passengerCount) {
          this.selectedSeats = this.availableSeats.slice(0, this.passengerCount);
        }
        this.cdr.detectChanges();
  }

  getSeatClass(seat: any): string {
    if (!seat) return '';

    let classes = seat.available ? 'available-seat ' : 'unavailable-seat ';

    if (seat.extraLegroom) classes += 'extra-legroom ';
    if (seat.exitRow) classes += 'exit-row ';
    if (this.selectedSeats.includes(seat.id)) classes += 'selected-seat ';
    return classes.trim();
  }

  searchSeats(list: { id: number }[], i: number): void {
    while (this.selectedSeats.length < this.passengerCount && i < list.length - 1) {
      let j = i + 1;
      if (list[i] && list[j] && list[i].id + 1 === list[j].id) {
        if (!this.selectedSeats.includes(list[i].id)) {
          this.selectedSeats.push(list[i].id);
        }
        if (this.selectedSeats.length < this.passengerCount) {
          this.selectedSeats.push(list[j].id);
        }
        i += 1;
      } else {
        i++;
      }
    }
  }

  selectSeat(seat: any): void {
    if (this.selectedSeats.includes(seat.id)) {
      this.selectedSeats = this.selectedSeats.filter(s => s !== seat.id);
    } else if (this.selectedSeats.length < this.passengerCount) {
      this.selectedSeats.push(seat.id);
    }
  }

  confirmSeat() {

    const passengerCountNumber = Number(this.passengerCount);

    if (this.selectedSeats.length !== passengerCountNumber) {
      alert(`Palun valige ${passengerCountNumber} istekohta`);
      return;
    }

    const reservation: Reservation = {
      user: this.user,
      flight: this.flight
    };

    this.reservationService.bookSeats(reservation, this.selectedSeats).subscribe({
      next: () => {
        alert(`Istmed on broneeritud!`);
        window.location.href = '/reservations';
      },
      error: err => {
        alert('Broneerimisel tekkis viga, proovige uuesti.');
      }

    });
  }

  chunkArray(myArray: any[], chunk_size: number): any[][] {
    const results = [];
    const arrayCopy = myArray.slice();
    while (arrayCopy.length) {
      results.push(arrayCopy.splice(0, chunk_size));
    }
    return results;
  }

  goBack() {
    this.selectedSeats = [];
    this.back.emit(); // Send a signal to the flight-list so that the seat selection disappears
  }

}
