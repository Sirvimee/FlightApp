import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { environment } from "src/app/environment/environment";
import { Observable } from "rxjs";
import { User } from "src/app/model/user";
import { RegisterRequest } from "src/app/model/registerRequest";

@Injectable({ providedIn: 'root' })
export class AuthService {
  private api = environment.apiUrl;

  constructor(private http: HttpClient) {}

  login(email: string, password: string): Observable<{ token: string, user: User }> {
    return this.http.post<{ token: string, user: User }>(
      `${this.api}/login`, { email, password }
    );
  }

  register(req: RegisterRequest): Observable<User> {
    return this.http.post<User>(`${this.api}/register`, req);
  }
}




