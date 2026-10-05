
CREATE TABLE muelles (
    muelle_id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    estado_disponibilidad VARCHAR(50) DEFAULT 'DISPONIBLE',
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_por BIGINT -- Ref lógica a usuario_id en iam_fin_db
);

CREATE TABLE buques (
    buque_id BIGSERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    matricula VARCHAR(50) UNIQUE NOT NULL,
    capacidad_maxima_teus INT NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE licitaciones (
    licitacion_id BIGSERIAL PRIMARY KEY,
    buque_id BIGINT NOT NULL,
    ruta VARCHAR(255) NOT NULL,
    puerto_origen VARCHAR(100) NOT NULL,
    puerto_destino VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL, -- EJ: PROGRAMADA, ABIERTA, ADJUDICADA
    precio_base DECIMAL(12, 2) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_por BIGINT, -- Ref lógica a usuario_id en iam_fin_db
    FOREIGN KEY (buque_id) REFERENCES buques(buque_id)
);

-- Tabla de Auditoría: ¿Quién cambió la licitación y cuándo?
CREATE TABLE historial_licitaciones (
    historial_id BIGSERIAL PRIMARY KEY,
    licitacion_id BIGINT NOT NULL,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50) NOT NULL,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cambiado_por BIGINT NOT NULL, -- Ref lógica a usuario_id en iam_fin_db
    FOREIGN KEY (licitacion_id) REFERENCES licitaciones(licitacion_id) ON DELETE CASCADE
);

CREATE TABLE contenedores (
    contenedor_id BIGSERIAL PRIMARY KEY,
    buque_id BIGINT,
    muelle_id BIGINT,
    codigo VARCHAR(50) UNIQUE NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL, -- EJ: EN_MUELLE, EMBARCADO, GATE_OUT
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado_por BIGINT, -- Ref lógica a usuario_id en iam_fin_db
    FOREIGN KEY (buque_id) REFERENCES buques(buque_id),
    FOREIGN KEY (muelle_id) REFERENCES muelles(muelle_id)
);

-- Tabla de Auditoría: Rastreo de movimientos físicos del contenedor
CREATE TABLE historial_contenedores (
    historial_id BIGSERIAL PRIMARY KEY,
    contenedor_id BIGINT NOT NULL,
    estado_anterior VARCHAR(50),
    estado_nuevo VARCHAR(50) NOT NULL,
    muelle_id_anterior BIGINT,
    muelle_id_nuevo BIGINT,
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cambiado_por BIGINT NOT NULL, -- Ref lógica a usuario_id en iam_fin_db
    FOREIGN KEY (contenedor_id) REFERENCES contenedores(contenedor_id) ON DELETE CASCADE
);

CREATE TABLE carga_seca (
    contenedor_id BIGINT PRIMARY KEY,
    tipo_embalaje VARCHAR(100),
    es_apilable BOOLEAN,
    FOREIGN KEY (contenedor_id) REFERENCES contenedores(contenedor_id) ON DELETE CASCADE
);

CREATE TABLE carga_refrigerada (
    contenedor_id BIGINT PRIMARY KEY,
    temperatura_requerida DECIMAL(5, 2), 
    requiere_ventilacion BOOLEAN,
    FOREIGN KEY (contenedor_id) REFERENCES contenedores(contenedor_id) ON DELETE CASCADE
);

CREATE TABLE carga_peligrosa (
    contenedor_id BIGINT PRIMARY KEY,
    clasificacion_imo VARCHAR(50), 
    instrucciones_manejo TEXT,
    FOREIGN KEY (contenedor_id) REFERENCES contenedores(contenedor_id) ON DELETE CASCADE
);

CREATE TABLE pujas (
    puja_id BIGSERIAL PRIMARY KEY,
    licitacion_id BIGINT NOT NULL,
    usuario_id BIGINT NOT NULL, -- Referencia lógica a iam_fin_db (El exportador que puja)
    monto DECIMAL(12, 2) NOT NULL,
    estado VARCHAR(50) NOT NULL, -- Ej: ACTIVA, CANCELADA, GANADORA, PERDEDORA
    fecha_puja TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (licitacion_id) REFERENCES licitaciones(licitacion_id) ON DELETE CASCADE
);