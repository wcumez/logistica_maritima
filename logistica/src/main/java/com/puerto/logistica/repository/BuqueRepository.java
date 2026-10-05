package com.puerto.logistica.repository;

import com.puerto.logistica.entity.Buque;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BuqueRepository extends JpaRepository<Buque, Long> {
}