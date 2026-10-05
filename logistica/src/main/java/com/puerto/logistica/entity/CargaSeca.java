package com.puerto.logistica.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "carga_seca")
public class CargaSeca extends Contenedor {

    @Column(name = "tipo_embalaje", length = 100)
    private String tipoEmbalaje;

    @Column(name = "es_apilable")
    private Boolean esApilable;

    // Getters y Setters
    public String getTipoEmbalaje() { return tipoEmbalaje; }
    public void setTipoEmbalaje(String tipoEmbalaje) { this.tipoEmbalaje = tipoEmbalaje; }
    
    public Boolean getEsApilable() { return esApilable; }
    public void setEsApilable(Boolean esApilable) { this.esApilable = esApilable; }
}