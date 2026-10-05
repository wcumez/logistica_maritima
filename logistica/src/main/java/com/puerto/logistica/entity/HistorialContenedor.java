package com.puerto.logistica.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "historial_contenedores")
public class HistorialContenedor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "historial_id")
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "contenedor_id", nullable = false)
    private Contenedor contenedor;

    @Column(name = "estado_anterior", length = 50)
    private String estadoAnterior;

    @Column(name = "estado_nuevo", nullable = false, length = 50)
    private String estadoNuevo;

    @Column(name = "muelle_id_anterior")
    private Long muelleIdAnterior;

    @Column(name = "muelle_id_nuevo")
    private Long muelleIdNuevo;

    @Column(name = "fecha_cambio", updatable = false)
    private LocalDateTime fechaCambio;

    @Column(name = "cambiado_por", nullable = false)
    private Integer cambiadoPor;

    @PrePersist
    protected void onCreate() {
        this.fechaCambio = LocalDateTime.now();
    }

    // Getters y Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Contenedor getContenedor() { return contenedor; }
    public void setContenedor(Contenedor contenedor) { this.contenedor = contenedor; }

    public String getEstadoAnterior() { return estadoAnterior; }
    public void setEstadoAnterior(String estadoAnterior) { this.estadoAnterior = estadoAnterior; }

    public String getEstadoNuevo() { return estadoNuevo; }
    public void setEstadoNuevo(String estadoNuevo) { this.estadoNuevo = estadoNuevo; }

    public Long getMuelleIdAnterior() { return muelleIdAnterior; }
    public void setMuelleIdAnterior(Long muelleIdAnterior) { this.muelleIdAnterior = muelleIdAnterior; }

    public Long getMuelleIdNuevo() { return muelleIdNuevo; }
    public void setMuelleIdNuevo(Long muelleIdNuevo) { this.muelleIdNuevo = muelleIdNuevo; }

    public LocalDateTime getFechaCambio() { return fechaCambio; }
    public void setFechaCambio(LocalDateTime fechaCambio) { this.fechaCambio = fechaCambio; }

    public Integer getCambiadoPor() { return cambiadoPor; }
    public void setCambiadoPor(Integer cambiadoPor) { this.cambiadoPor = cambiadoPor; }
}