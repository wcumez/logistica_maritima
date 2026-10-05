package com.puerto.logistica.repository;

import com.puerto.logistica.entity.HistorialLicitacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistorialLicitacionRepository extends JpaRepository<HistorialLicitacion, Long> {
}