import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Reservation } from '../model/reservation';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root',
})
export class ReservationService {
  private readonly apiUrl = environment.apiUrl;
  private headers = new HttpHeaders().set('Content-Type', 'application/json');

  constructor(private http: HttpClient) {}

  bookSeats(reservation: Reservation, seatIds: number[]): Observable<any> {
    const params = new HttpParams().set('seatIds', seatIds.join(','));
    return this.http.post<any>(`${this.apiUrl}/reservations`, reservation, {
      headers: this.headers,
      params: params,
    });
  }

  getReservationsByUserId(userId: string): Observable<Reservation[]> {
    return this.http.get<Reservation[]>(
      `${this.apiUrl}/reservations/user/${userId}`,
      { headers: this.headers }
    );
  }

  getReservationById(reservationId: number): Observable<Reservation> {
    return this.http.get<Reservation>(
      `${this.apiUrl}/reservations/${reservationId}`,
      { headers: this.headers }
    );
  }

  cancelReservation(reservationId: number): Observable<any> {
    return this.http.delete<any>(
      `${this.apiUrl}/reservations/${reservationId}`,
      { headers: this.headers }
    );
  }
}
