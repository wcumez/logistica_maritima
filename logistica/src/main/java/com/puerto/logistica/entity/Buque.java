package com.puerto.logistica.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "buques")
public class Buque {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "buque_id")
    private Long id;

    @Column(nullable = false, length = 100)
    private String nombre;

    @Column(nullable = false, unique = true, length = 50)
    private String matricula;

    @Column(name = "capacidad_maxima_teus", nullable = false)
    private Integer capacidadMaximaTeus;

    @Column(name = "fecha_creacion", updatable = false)
    private LocalDateTime fechaCreacion;

    // Intercepta el guardado para asignar la fecha exacta de auditoría automáticamente
    @PrePersist
    protected void onCreate() {
        this.fechaCreacion = LocalDateTime.now();
    }

    // JPA exige un constructor vacío
    public Buque() {
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Integer getCapacidadMaximaTeus() {
        return capacidadMaximaTeus;
    }

    public void setCapacidadMaximaTeus(Integer capacidadMaximaTeus) {
        this.capacidadMaximaTeus = capacidadMaximaTeus;
    }

    public LocalDateTime getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDateTime fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }
}