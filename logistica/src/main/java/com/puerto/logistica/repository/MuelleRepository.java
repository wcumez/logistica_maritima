package com.puerto.logistica.repository;

import com.puerto.logistica.entity.Muelle;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MuelleRepository extends JpaRepository<Muelle, Long> {
}