-- Script de inicialização do banco de dados Marketplace
-- Este arquivo será executado automaticamente quando o container for criado pela primeira vez

-- Criar extensões úteis
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Criar schema para o marketplace
CREATE SCHEMA IF NOT EXISTS marketplace;

-- Definir o schema padrão
SET search_path TO marketplace, public;

-- Exemplo de tabelas para um marketplace (você pode customizar conforme necessário)

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS marketplace.users (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de produtos
CREATE TABLE IF NOT EXISTS marketplace.products (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    seller_id UUID NOT NULL REFERENCES marketplace.users(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pedidos
CREATE TABLE IF NOT EXISTS marketplace.orders (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID NOT NULL REFERENCES marketplace.users(id),
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de itens do pedido
CREATE TABLE IF NOT EXISTS marketplace.order_items (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    order_id UUID NOT NULL REFERENCES marketplace.orders(id) ON DELETE CASCADE,
    product_id UUID NOT NULL REFERENCES marketplace.products(id),
    quantity INTEGER NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

-- Criar índices para melhorar performance
CREATE INDEX IF NOT EXISTS idx_products_seller_id ON marketplace.products(seller_id);
CREATE INDEX IF NOT EXISTS idx_orders_user_id ON marketplace.orders(user_id);
CREATE INDEX IF NOT EXISTS idx_order_items_order_id ON marketplace.order_items(order_id);
CREATE INDEX IF NOT EXISTS idx_order_items_product_id ON marketplace.order_items(product_id);

-- Criar função para atualizar updated_at automaticamente
CREATE OR REPLACE FUNCTION marketplace.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Criar triggers para atualizar updated_at
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON marketplace.users
    FOR EACH ROW EXECUTE FUNCTION marketplace.update_updated_at_column();

CREATE TRIGGER update_products_updated_at BEFORE UPDATE ON marketplace.products
    FOR EACH ROW EXECUTE FUNCTION marketplace.update_updated_at_column();

CREATE TRIGGER update_orders_updated_at BEFORE UPDATE ON marketplace.orders
    FOR EACH ROW EXECUTE FUNCTION marketplace.update_updated_at_column();

