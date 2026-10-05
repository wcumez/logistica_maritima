package com.puerto.logistica.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "carga_peligrosa")
public class CargaPeligrosa extends Contenedor {

    @Column(name = "clasificacion_imo", length = 50)
    private String clasificacionImo;

    @Column(name = "instrucciones_manejo", columnDefinition = "TEXT")
    private String instruccionesManejo;

    // Getters y Setters
    public String getClasificacionImo() { return clasificacionImo; }
    public void setClasificacionImo(String clasificacionImo) { this.clasificacionImo = clasificacionImo; }
    
    public String getInstruccionesManejo() { return instruccionesManejo; }
    public void setInstruccionesManejo(String instruccionesManejo) { this.instruccionesManejo = instruccionesManejo; }
}