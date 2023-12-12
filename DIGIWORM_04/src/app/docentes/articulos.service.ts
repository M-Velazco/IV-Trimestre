
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ArticulosService {

  url='http://localhost/PROYECTO/DIGIWORM_04/src/app/docentes/php/recuperartodos.php'; // disponer url de su servidor que tiene las páginas PHP

  constructor(private http: HttpClient) { }

  recuperarTodos() {
    return this.http.get(`${this.url}recuperartodos.php`);
  }

  alta(articulo:any) {
    return this.http.post(`${this.url}alta.php`, JSON.stringify(articulo));
  }

  baja(iddocente: number) {
    return this.http.get(`${this.url}baja.php?iddocente=${iddocente}`);
  }


  seleccionar(codigo:number) {
    return this.http.get(`${this.url}seleccionar.php?codigo=${codigo}`);
  }

  modificacion(articulo:any) {
    return this.http.post(`${this.url}modificacion.php`, JSON.stringify(articulo));
  }
}
