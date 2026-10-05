package com.puerto.logistica.repository;

import com.puerto.logistica.entity.Licitacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LicitacionRepository extends JpaRepository<Licitacion, Long> {
}