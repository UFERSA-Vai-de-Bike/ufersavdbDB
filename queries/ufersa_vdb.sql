-- Para simular algum funcionamento prévio

-- abre 4 empréstimos
-- SELECT open_vdb_log(1,1,1,1);
-- SELECT open_vdb_log(2,3,2,1);
-- SELECT open_vdb_log(3,2,1,2);
-- SELECT open_vdb_log(4,5,3,1);

-- Fecha os dois primeiros
-- SELECT close_vdb_log(1,1,2,1);
-- SELECT close_vdb_log(2,3,1,1);

-- select getOnRideBikes();
-- select * from getHistsBike('');

-- CREATE TEMP TABLE tmp123 AS select st.idStation, st.name, st.lat,st.lon, array_agg((ss.slot,ss.state,ss.bike)) as slots from bike_station as st, station_slot as ss where ss.idStation = st.idStation GROUP BY st.idStation LIMIT  0;

-- SELECT attname, format_type(atttypid, atttypmod) AS type
-- FROM   pg_attribute
-- WHERE  attrelid = 'tmp123'::regclass
-- AND    attnum > 0
-- AND    NOT attisdropped
-- ORDER  BY attnum;

-- select st.idStation, st.name, st.lat,st.lon, array_agg('[' || ss.slot || ',' || ss.state || ',' || ss.bike || ']') as slots from bike_station as st, station_slot as ss where ss.idStation = st.idStation GROUP BY st.idStation;


-- drop FUNCTION IF EXISTS getValSts();

-- CREATE OR REPLACE FUNCTION getValSts()
-- RETURNS TABLE(idStation bike_station.idStation%TYPE,name bike_station.name%TYPE,lat bike_station.lat%TYPE, lon bike_station.lon%TYPE, slots RECORD) AS $$
-- BEGIN
-- 	SELECT st.idStation, st.name, st.lat,st.lon, array_agg((ss.slot,ss.state,ss.bike)) AS slots FROM bike_station AS st, station_slot AS ss WHERE st.state = TRUE AND ss.idStation = st.idStation GROUP BY st.idStation;
-- END;
-- $$ LANGUAGE sql;

-- select getValSts();

-- select st.idStation, st.name, st.lat,st.lon, array_agg('[' || ss.slot || ',' || ss.state || ',' || ss.bike || ']') as slots from bike_station as st, station_slot as ss where ss.idStation = st.idStation GROUP BY st.idStation;


-- a volta da Eugena (Bike)
-- SELECT upd_bike_pos(1,-5.204424, -37.323591);
-- SELECT upd_bike_pos(1,-5.204018, -37.324184);
-- SELECT upd_bike_pos(1,-5.203671, -37.324697);
-- SELECT upd_bike_pos(1,-5.203450, -37.325152);
-- SELECT upd_bike_pos(1,-5.203920, -37.325377);
-- SELECT upd_bike_pos(1,-5.204347, -37.324948);
-- SELECT upd_bike_pos(1,-5.204924, -37.324117);
-- SELECT upd_bike_pos(1,-5.204790, -37.323342);

-- a volta da Leanne (Bike)
-- SELECT upd_bike_pos(2,-5.204663, -37.323250);
-- SELECT upd_bike_pos(2,-5.204857, -37.322978);
-- SELECT upd_bike_pos(2,-5.205025, -37.322713);
-- SELECT upd_bike_pos(2,-5.204871, -37.322603);
-- SELECT upd_bike_pos(2,-5.204671, -37.322568);
-- SELECT upd_bike_pos(2,-5.204476, -37.322846);
-- SELECT upd_bike_pos(2,-5.204381, -37.323038);
-- SELECT upd_bike_pos(2,-5.204518, -37.323142);

-- a volta da Tawana (Bike)
-- SELECT upd_bike_pos(3,-5.206759, -37.323583);
-- SELECT upd_bike_pos(3,-5.207230, -37.322935);
-- SELECT upd_bike_pos(3,-5.207388, -37.322224);
-- SELECT upd_bike_pos(3,-5.206800, -37.322406);
-- SELECT upd_bike_pos(3,-5.206552, -37.322254);
-- SELECT upd_bike_pos(3,-5.207003, -37.321896);
-- SELECT upd_bike_pos(3,-5.206439, -37.322862);
-- SELECT upd_bike_pos(3,-5.206170, -37.323212);

-- a volta da Loraine (Bike)
-- SELECT upd_bike_pos(5,-5.203072, -37.327630);
-- SELECT upd_bike_pos(5,-5.203547, -37.328208);
-- SELECT upd_bike_pos(5,-5.204170, -37.328853);
-- SELECT upd_bike_pos(5,-5.204463, -37.328584);
-- SELECT upd_bike_pos(5,-5.204703, -37.328305);
-- SELECT upd_bike_pos(5,-5.204495, -37.327991);
-- SELECT upd_bike_pos(5,-5.203907, -37.327382);
-- SELECT upd_bike_pos(5,-5.203375, -37.327251);




-- SELECT upd_bike_pos(3,lat,lon);
-- SELECT upd_bike_pos(4,lat,lon);
select * from getStations();

select * from getBikes();