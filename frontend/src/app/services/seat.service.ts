import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SeatService {
  private apiUrl = 'http://localhost:8080/seats';

  constructor(private http: HttpClient) {}

  getSeatsForFlight(flightId: number): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${flightId}`);
  }
}