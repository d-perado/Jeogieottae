package com.example.jeogieottae.domain.room.repository;

import com.example.jeogieottae.domain.room.entity.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Long> {
}
