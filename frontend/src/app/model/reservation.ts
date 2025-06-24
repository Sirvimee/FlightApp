import { Flight } from './flight';
import { User } from './user';

export interface Reservation {
  id?: number;
  user: User;
  flight: Flight;
}
