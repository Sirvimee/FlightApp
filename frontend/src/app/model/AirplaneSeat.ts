import { Airplane } from "./airplane";
import { Seat } from "./seat";

export interface AirplaneSeat {
    id: number;
    airplane: Airplane;
    seat: Seat;
}