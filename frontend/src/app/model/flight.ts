export interface Flight {
    id: number;
    date: string;
    airline: string;
    destination: string;
    departureTime: Date; 
    arrivalTime: string; 
    price: number;
    passengerCount: number;
  }