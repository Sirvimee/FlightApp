import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs'; 
import { Reservation } from '../model/reservation';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root'
})

export class ReservationService {

  // private apiUrl = 'http://localhost:8080/reservations';

  private readonly apiUrl = environment.apiUrl;

  private headers = new HttpHeaders().set('Content-Type', 'application/json');

  constructor(private http: HttpClient) {}

  bookSeats(reservation: Reservation, seatIds: number[]): Observable<any> {

    const params = new HttpParams().set('seatIds', seatIds.join(','));

    return this.http.post<any>(`${this.apiUrl}/reservations`, reservation, { headers: this.headers, params: params });
  }
}