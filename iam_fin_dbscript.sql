DROP TABLE IF EXISTS transacciones_token, billeteras, usuarios CASCADE;

CREATE TABLE usuarios (
    usuario_id BIGSERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    rol VARCHAR(50) NOT NULL,
    estado_cuenta VARCHAR(20) DEFAULT 'ACTIVO',
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_actualizacion_password TIMESTAMP
);

CREATE TABLE billeteras (
    billetera_id BIGSERIAL PRIMARY KEY,
    usuario_id BIGINT UNIQUE REFERENCES usuarios(usuario_id) ON DELETE CASCADE,
    saldo_tokens NUMERIC(12,2) DEFAULT 0.00,
    fondos_bloqueados NUMERIC(12,2) DEFAULT 0.00,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacciones_token (
    transaccion_id BIGSERIAL PRIMARY KEY,
    billetera_id BIGINT REFERENCES billeteras(billetera_id) ON DELETE CASCADE,
    tipo_transaccion VARCHAR(50) NOT NULL,
    monto NUMERIC(12,2) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_transaccion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);