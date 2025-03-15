import { Reservation } from "./reservation";
import { FlightSeat } from "./flightSeat";

export interface ReservationSeats {
  id: number;
  reservations: Reservation;
  flight: FlightSeat;
}