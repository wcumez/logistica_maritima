package com.puerto.logistica.repository;

import com.puerto.logistica.entity.HistorialContenedor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistorialContenedorRepository extends JpaRepository<HistorialContenedor, Long> {
}