export interface Seat {
    id: number;
    seatNumber: string;
    seatType: string;
    seatClass: string;
    extraLegroom: boolean;
    exitRow: boolean;
    reservation: string | null;
    available: boolean;
  }