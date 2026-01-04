package com.example.jeogieottae.domain.reservation.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@AllArgsConstructor
public class CreateReservationRequest {

    private Long roomId;
    private Long userCouponId;
    private LocalDateTime checkIn;
    private LocalDateTime checkOut;
    private Long guest;
}
