export interface Flight {
    id: number;
    date: string;
    airline: string;
    destination: string;
    departureTime: Date; // Stringina, kuna see tuleb backendist stringina
    arrivalTime: string; // Kuupäeva stringina
    price: number;
    passengerCount: number;
  }