import { Reservation } from "./reservation";
import { Seat } from "./seat";

export interface ReservationSeats {
  id: number;
  reservations: Reservation;
  seat: Seat;
}