import { Airplane } from "./airplane";

export interface Flight {
  id: number;
  date: string;
  airline: string;
  destination: string;
  departureTime: string;
  arrivalTime: string;
  price: number;
  airplane: Airplane;
}
