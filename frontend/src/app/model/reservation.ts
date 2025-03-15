import { Flight } from './flight';
import { ReservationSeats } from './reservationSeat';

export interface Reservation {
  id?: number;
  passengerName: string;
  flight: Flight;
}