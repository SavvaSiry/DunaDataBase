insert into clan (name)
values ('Thinking machines'),
       ('Swordmasters of the Ginaz'),
       ('Sardaukars'),
       ('Suk School'),
       ('Bene Gesserit'),
       ('Fremen'),
       ('Atreides'),
       ('Harkonnen'),
       ('Ordos'),
       ('Corrino');

insert into spice_storage (weight, clan_id)
values (767188, 8),
       (873136, 4),
       (684775, 5),
       (230783, 9),
       (325089, 5),
       (915638, 3),
       (632953, 5),
       (684172, 1),
       (626313, 3),
       (680854, 7);

insert into worker_type (name)
values ('security'),
       ('miner'),
       ('military'),
       ('guard'),
       ('retinue'),
       ('priest'),
       ('baker'),
       ('salesman'),
       ('scientist'),
       ('street cleaner'),
       ('maid'),
       ('driver'),
       ('referee'),
       ('advocate'),
       ('doctor'),
       ('engineer'),
       ('cladman'),
       ('gardener');

insert into location_type (name)
values ('plain'),
       ('mountain'),
       ('ridge'),
       ('plateau'),
       ('dalina'),
       ('Lake'),
       ('dune'),
       ('desert'),
       ('rock'),
       ('cape'),
       ('oasis');

insert into place_type (name)
values ('town'),
       ('settlement'),
       ('village'),
       ('mine');

insert into event_type (id, name)
values
(1,'worm attacks'),
(2,'sandstorm'),
(3,'earthquake');

insert into tech_type (name)
values
('dragonfly'),
('Boer'),
('loader'),
('carrier'),
('cargo cruiser'),
('military cruiser'),
('disant car'),
('spice collector'),
('spice locator');







