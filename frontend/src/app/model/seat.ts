import { Airplane } from "./airplane";
import { ReservationSeats } from "./reservationSeat";

export interface Seat {
  id: number;
  seatNumber: string;
  seatType: string;
  seatClass: string;
  extraLegroom: boolean;
  exitRow: boolean;
}