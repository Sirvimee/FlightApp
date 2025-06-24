import { Component } from "@angular/core";
import { FormBuilder, Validators } from "@angular/forms";
import { AuthService } from "../services/auth.service";
import { TokenStorageService } from "../services/token-storage.service";
import { Router } from "@angular/router";
import { AppComponent } from "src/app/app.component";
import { User } from "src/app/model/user";

@Component({ templateUrl: './login.component.html', standalone: false })
export class LoginComponent {
  form = this.fb.group({
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required]
  });
  error = '';

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private store: TokenStorageService,
    private router: Router,
    private app: AppComponent
  ) {}

  submit() {
    if (this.form.invalid) return;
    const { email, password } = this.form.value;
    this.auth.login(email!, password!).subscribe({
      next: (result: { token: string, user: User }) => {
        this.store.save(result.token);
        localStorage.setItem('user', JSON.stringify(result.user));
        this.app.isLoggedIn = true;
        this.router.navigate(['/']);
      },
      error: () => this.error = 'Vale e-post või parool'
    });
  }
}
