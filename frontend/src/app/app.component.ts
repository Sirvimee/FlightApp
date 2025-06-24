import { Component, OnInit } from '@angular/core';
import { AuthService } from './auth/services/auth.service';
import { User } from './model/user';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'frontend';
  user: User | null = JSON.parse(localStorage.getItem('user') || 'null');
  isLoggedIn = false;

  constructor(private authService: AuthService) {}

  ngOnInit() {
    this.user = JSON.parse(localStorage.getItem('user') || 'null');
    this.isLoggedIn = !!this.user;
  }

  logout() {
    localStorage.removeItem('jwt');
    localStorage.removeItem('user');
    window.location.href = '/';
  }
}
