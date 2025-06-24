import { Component } from "@angular/core";
import { AbstractControl, FormBuilder, Validators } from "@angular/forms";
import { AuthService } from "../services/auth.service";
import { Router } from "@angular/router";

@Component({ templateUrl: './register.component.html' })
export class RegisterComponent {
  form = this.fb.group({
    firstName: ['', Validators.required],
    lastName: ['', Validators.required],
    email: ['', [Validators.required, Validators.email]],
    password: ['', Validators.required],
    confirm: ['', Validators.required]
  }, { validators: this.passwordMatch });

  error = '';
  ok = false;

  constructor(
    private fb: FormBuilder,
    private auth: AuthService,
    private router: Router) {}

  private passwordMatch(group: AbstractControl) {
    const p = group.get('password')?.value;
    const c = group.get('confirm')?.value;
    return p === c ? null : { mismatch: true };
  }

  submit() {
    if (this.form.invalid) return;
    const { firstName, lastName, email, password } = this.form.value;
    this.auth.register({ firstName, lastName, email, password } as any)
      .subscribe({
        next: () => {
          this.ok = true;
          this.auth.login(email!, password!).subscribe({
            next: () => {
              this.router.navigate(['/']);
            },
            error: err => this.error = err.error?.message || 'Sisselogimine ebaõnnestus'
          });
        },
        error: err => this.error = err.error?.message || 'Registreerimine ebaõnnestus'
      });
  }
}
