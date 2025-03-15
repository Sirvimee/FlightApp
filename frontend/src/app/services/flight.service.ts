import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Flight } from '../model/flight';
import { environment } from '../environment/environment';

@Injectable({
  providedIn: 'root'
})
export class FlightService {

  private readonly apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {}

  getFlights(): Observable<Flight[]> {
    return this.http.get<Flight[]>(`${this.apiUrl}/flights`);
  }
}