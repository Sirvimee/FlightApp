import { Reservation } from "./reservation";
import { FlightSeat } from "./flightSeat";
import { Flight } from "./flight";
import { User } from "./user";

export interface ReservationSeats {
  id: number;
  reservation: Reservation;
  flightSeat: FlightSeat;
  flight: Flight;
  user: User;
}
