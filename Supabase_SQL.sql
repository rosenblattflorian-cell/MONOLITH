-- PROFILES
create table if not exists profiles (
  id uuid references auth.users not null,
  role text check (role in ('sales','warehouse')),
  primary key (id)
);

-- WAREHOUSE ITEMS
create table if not exists warehouse_items (
  id uuid primary key default gen_random_uuid(),
  name text,
  article_number text,
  stock_total int,
  stock_reserved int default 0
);

-- ORDERS
create table if not exists orders (
  id uuid primary key default gen_random_uuid(),
  lead_id uuid,
  status text
);

-- ORDER ITEMS
create table if not exists order_items (
  id uuid primary key default gen_random_uuid(),
  order_id uuid references orders(id),
  item_id uuid references warehouse_items(id),
  quantity int
);