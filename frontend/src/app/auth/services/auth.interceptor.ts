import { HttpHandler, HttpInterceptor, HttpRequest } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { TokenStorageService } from "./token-storage.service";

@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  constructor(private store: TokenStorageService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const jwt = this.store.get();
    if (jwt) {
      req = req.clone({ setHeaders: { Authorization: `Bearer ${jwt}` } });
    }
    return next.handle(req);
  }
}
