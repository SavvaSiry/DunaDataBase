-- Удалить все записи где добыча идет не в локации типа mine
delete
from mining
    using place
where mining.place_id = place.id
  and place.type_id <= 3;

-- Список всех населенных пунктов название, тип
select place.id, place.name, place_type.name
from place
         inner join place_type on type_id = place_type.id
where place_type.id < 3;

-- Создание новой поставки сапайса
insert into order_spice (clan_id, customer, weight, status, date)
values (3, 5, 877161, 'INPROGRESS', '08-Sep-1932');

--  Изменить параметры  поставки спайса
update order_spice
set status = 'DONE'
where customer = 5
  and clan_id = 3
  and status = 'INPROGRESS';

-- Получить список поставок клана Атрейдесов
select clan.name, order_spice.id, order_spice.status
from order_spice
         inner join clan on clan.id = order_spice.customer
    and customer = (select clan.id from clan where clan.name = 'Atreides');

-- Получить список угроз для месторождения спайса
select clan.name, place.name, place_type.name, event_type.name, event.dangerous
from place
         inner join clan_place on place.id = clan_place.place_id
         inner join clan on clan.id = clan_place.clan_id
         inner join event on place.id = event.place_id
         inner join place_type on place_type.id = place.type_id
         inner join event_type on event.event_type = event_type.id
where place_type.name = 'mine';

-- Получить список техники на месторождении
select place.name, tech_type.name, technique.mining_rate
from place
    inner join technique on technique.place_id = place.id
    inner join tech_type on tech_type.id = technique.type_id
where place.name = 'Merapit';

-- Получить информацию по количеству добываемого спайса
select




