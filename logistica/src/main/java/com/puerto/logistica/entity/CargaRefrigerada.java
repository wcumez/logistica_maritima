package com.puerto.logistica.entity;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "carga_refrigerada")
public class CargaRefrigerada extends Contenedor {

    @Column(name = "temperatura_requerida", precision = 5, scale = 2)
    private BigDecimal temperaturaRequerida;

    @Column(name = "requiere_ventilacion")
    private Boolean requiereVentilacion;

    // Getters y Setters
    public BigDecimal getTemperaturaRequerida() { return temperaturaRequerida; }
    public void setTemperaturaRequerida(BigDecimal temperaturaRequerida) { this.temperaturaRequerida = temperaturaRequerida; }
    
    public Boolean getRequiereVentilacion() { return requiereVentilacion; }
    public void setRequiereVentilacion(Boolean requiereVentilacion) { this.requiereVentilacion = requiereVentilacion; }
}