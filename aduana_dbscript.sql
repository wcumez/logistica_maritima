DROP TABLE IF EXISTS inspecciones_fisicas, historial_bloqueos, bloqueos_aduaneros CASCADE;

CREATE TABLE bloqueos_aduaneros (
    bloqueo_id BIGSERIAL PRIMARY KEY,
    contenedor_id BIGINT NOT NULL, -- BIGINT para coincidir con logistica_db
    inspector_original_id INT,
    motivo TEXT,
    estado VARCHAR(50),
    fecha_bloqueo TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_por INT
);

CREATE TABLE historial_bloqueos (
    historial_id BIGSERIAL PRIMARY KEY,
    bloqueo_id BIGINT REFERENCES bloqueos_aduaneros(bloqueo_id) ON DELETE CASCADE,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cambiado_por INT
);

CREATE TABLE inspecciones_fisicas (
    inspeccion_id BIGSERIAL PRIMARY KEY,
    bloqueo_id BIGINT REFERENCES bloqueos_aduaneros(bloqueo_id) ON DELETE CASCADE,
    inspector_id INT,
    resultado_semaforo VARCHAR(20),
    comentarios TEXT,
    fecha_inspeccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
