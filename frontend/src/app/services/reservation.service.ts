import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ReservationService {
  private apiUrl = 'http://localhost:8080/reservations/book';

  constructor(private http: HttpClient) {}

  bookSeats(flightId: number, passengerName: string, numberOfSeats: number): Observable<any> {
    return this.http.post<any>(this.apiUrl, { flightId, passengerName, numberOfSeats });
  }
}