import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, Observable } from 'rxjs';
import { Seat } from '../model/seat';

@Injectable({
  providedIn: 'root'
})
export class SeatService {
  private apiUrl = 'http://localhost:8080/seats';

  constructor(private http: HttpClient) {}

  getSeatsForFlight(airplaneId: number): Observable<Seat[]> {
    return this.http.get<Seat[]>(`${this.apiUrl}/${airplaneId}`);
  }
}