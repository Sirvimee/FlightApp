import { Flight } from "./flight";
import { Seat } from "./seat";

export interface FlightSeat {
  id: number;
  available: boolean;
  flight: Flight;
  seat: Seat;
}