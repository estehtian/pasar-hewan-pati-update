CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE TABLE IF NOT EXISTS users(
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(), name VARCHAR(140) NOT NULL,
 email VARCHAR(190) UNIQUE NOT NULL, phone VARCHAR(30), password_hash TEXT NOT NULL,
 role VARCHAR(20) NOT NULL CHECK(role IN('admin','seller','staff')),
 is_active BOOLEAN NOT NULL DEFAULT TRUE, created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS animals(
 id UUID PRIMARY KEY DEFAULT gen_random_uuid(), seller_id UUID NOT NULL REFERENCES users(id),
 listing_code VARCHAR(30) UNIQUE NOT NULL, animal_type VARCHAR(40) NOT NULL, breed VARCHAR(100),
 sex VARCHAR(20), age_months INTEGER CHECK(age_months IS NULL OR age_months>=0),
 weight_kg NUMERIC(10,2) CHECK(weight_kg IS NULL OR weight_kg>=0),
 price_idr BIGINT CHECK(price_idr IS NULL OR price_idr>=0), location_name VARCHAR(180) NOT NULL,
 description TEXT, photo_urls JSONB NOT NULL DEFAULT '[]',
 status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK(status IN('draft','pending','active','rejected','reserved','sold','suspended')),
 rejection_note TEXT, submitted_at TIMESTAMPTZ, reviewed_by UUID REFERENCES users(id),
 reviewed_at TIMESTAMPTZ, created_at TIMESTAMPTZ DEFAULT NOW(), updated_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE INDEX IF NOT EXISTS animals_status_idx ON animals(status);
CREATE INDEX IF NOT EXISTS animals_seller_idx ON animals(seller_id);
CREATE TABLE IF NOT EXISTS audit_logs(
 id BIGSERIAL PRIMARY KEY, actor_id UUID REFERENCES users(id), action VARCHAR(80) NOT NULL,
 entity_type VARCHAR(50) NOT NULL, entity_id UUID, details JSONB DEFAULT '{}', created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS whatsapp_messages(
 id BIGSERIAL PRIMARY KEY, wa_message_id VARCHAR(180) UNIQUE, wa_from VARCHAR(40),
 direction VARCHAR(10) NOT NULL CHECK(direction IN('in','out')), message_type VARCHAR(40),
 body TEXT, status VARCHAR(40), payload JSONB DEFAULT '{}', created_at TIMESTAMPTZ DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS webhook_events(
 id BIGSERIAL PRIMARY KEY, payload JSONB NOT NULL, received_at TIMESTAMPTZ DEFAULT NOW()
);
