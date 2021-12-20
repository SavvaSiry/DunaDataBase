create type tech_status as enum ('FROM_FACTORY', 'BATTLE_HARDENED', 'DESTROYED');

alter type tech_status owner to s283235;

create table location_type
(
    id   serial
        constraint location_type_pkey
            primary key,
    name varchar(255) not null
);

alter table location_type
    owner to s283235;

create index pk
    on location_type (id);

create unique index location_type_name_uindex
    on location_type (name);

create table location
(
    id      serial
        constraint location_pk
            primary key,
    name    varchar(255) not null,
    type_id integer
        constraint location_location_type_id_fk
            references location_type
);

alter table location
    owner to s283235;

create index pk_location
    on location (id);

create unique index location_name_uindex
    on location (name);

create table worker_type
(
    id   serial
        constraint worker_type_pkey
            primary key,
    name varchar(255) not null
);

alter table worker_type
    owner to s283235;

create index pk_worker_type
    on worker_type (id);

create unique index worker_type_name_uindex
    on worker_type (name);

create table place_type
(
    id   serial
        constraint place_type_pk
            primary key,
    name varchar(255)
);

alter table place_type
    owner to s283235;

create table place
(
    id          serial
        constraint place_pk
            primary key,
    name        varchar(255) not null,
    type_id     integer
        constraint place_place_type_id_fk
            references place_type,
    location_id integer
        constraint place_location_id_fk
            references location
);

alter table place
    owner to s283235;

create unique index place_name_uindex
    on place (name);

create unique index place_type_name_uindex
    on place_type (name);

create table clan
(
    id   serial
        constraint clan_pkey
            primary key,
    name varchar(255) not null
        constraint clan_name_key
            unique
);

alter table clan
    owner to s283235;

create index pk_clan
    on clan (id);

create table spice_storage
(
    id      serial
        constraint spice_storage_pkey
            primary key,
    weight  numeric not null
        constraint spice_storage_weight_check
            check (weight > (0)::numeric),
    clan_id integer not null
        constraint spice_storage_clan_id_fk
            references clan
);

alter table spice_storage
    owner to s283235;

create index pk_spice_storage
    on spice_storage (id);

create table spice_goods
(
    seller      integer      not null
        constraint spice_goods_clan_id_fk
            references clan,
    spice_price numeric      not null
        constraint spice_goods_spice_price_check
            check (spice_price > (0)::numeric),
    name_item   varchar(255) not null,
    id          integer      not null
        constraint spice_goods_pkey
            primary key
);

alter table spice_goods
    owner to s283235;

create index pk_spice_goods
    on spice_goods (id);

create index fk_spice_goods_seller
    on spice_goods (seller);

create table purchases
(
    buyer integer not null
        constraint purchases_clan_id_fk
            references clan,
    item  integer not null
        constraint purchases_spice_goods_id_fk
            references spice_goods,
    date  timestamp,
    id    integer not null
        constraint purchases_pkey
            primary key
);

alter table purchases
    owner to s283235;

create index id_purchases
    on purchases (id);

create table creature
(
    clan_id  integer      not null
        constraint creature_clan_id_fk
            references clan,
    birthday date         not null,
    name     varchar(255) not null,
    id       serial
        constraint creature_pkey
            primary key
);

alter table creature
    owner to s283235;

create index pk_creature
    on creature (id);

create unique index creature_name_uindex
    on creature (name);

create table tech_type
(
    id   serial
        constraint tech_type_pk
            primary key,
    name varchar(255)
);

alter table tech_type
    owner to s283235;

create index pk_tech_type
    on tech_type (id);

create unique index tech_type_name_uindex
    on tech_type (name);

create table technique
(
    combat_strength numeric,
    mining_rate     numeric,
    status          tech_status,
    id              serial
        constraint technique_pk
            primary key,
    type_id         integer
        constraint technique_tech_type_id_fk
            references tech_type,
    place_id        integer
        constraint technique_place_id_fk
            references place
);

alter table technique
    owner to s283235;

create index pk_technique
    on technique (id);

create table worker
(
    type_id     integer not null
        constraint worker_worker_type_id_fk
            references worker_type
            on delete set null,
    id          serial
        constraint worker_pkey
            primary key,
    creature_id integer not null
        constraint worker_creature_id_fk
            references creature
);

alter table worker
    owner to s283235;

create index key_worker
    on worker (id);

create table event
(
    date      timestamp,
    dangerous integer,
    name      varchar(255),
    place_id  integer
        constraint event_place_id_fk
            references place,
    id        serial
        constraint event_pk
            primary key
);

alter table event
    owner to s283235;

create index pk_event
    on event (id);

create table order_spice
(
    clan_id  integer      not null
        constraint order_spice_clan_id_fk
            references clan,
    customer integer      not null
        constraint order_spice_clan_id_fk_2
            references clan,
    status   varchar(255) not null,
    weight   numeric
        constraint order_spice_weight_check
            check (weight > (0)::numeric),
    id       serial
        constraint order_spice_pkey
            primary key,
    date     timestamp    not null
);

alter table order_spice
    owner to s283235;

create index pk_order_spice
    on order_spice (id);

create index fk_clan_id
    on order_spice (clan_id);

create table clan_place
(
    clan_id  integer not null
        constraint clan_place_clan_id_fk
            references clan,
    id       serial
        constraint clan_place_pkey
            primary key,
    place_id integer not null
        constraint clan_place_place_id_fk
            references place
);

alter table clan_place
    owner to s283235;

create index index_clan_place_id
    on clan_place (id);

create index index_place_id
    on clan_place (place_id);

create index index_clan_id
    on clan_place (clan_id);

create table mining
(
    worker_id integer not null
        constraint mining_worker_id_fk
            references worker,
    place_id  integer not null
        constraint mining_place_id_fk
            references place,
    order_id  integer not null
        constraint mining_order_spice_id_fk
            references order_spice,
    id        serial
        constraint mining_pkey
            primary key
);

alter table mining
    owner to s283235;

create index index_mining_id
    on mining (id);

create index index_mining_place_id
    on mining (place_id);

create index index_mining_order_id
    on mining (order_id);

create index index_mining_worker_id
    on mining (worker_id);

create table event_type
(
    id   serial
        constraint event_type_pk
            primary key,
    name varchar(128) not null
);

alter table event_type
    owner to s283235;

create unique index event_type_name_uindex
    on event_type (name);

