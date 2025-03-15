import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, Observable } from 'rxjs';
import { Seat } from '../model/seat';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root'
})
export class SeatService {

  private readonly apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  getSeatsForFlight(airplaneId: number): Observable<Seat[]> {
    return this.http.get<Seat[]>(`${this.apiUrl}/seats/${airplaneId}`);
  }
}