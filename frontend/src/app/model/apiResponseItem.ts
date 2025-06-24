export interface ApiResponseItem {
  date: string;
  arrivalId: string;
  flights: {
    date: string;
    airline: string;
    arrivalAirport: string;
    departureTime: string;
    arrivalTime: string;
  }[];
}
