DROP TABLE IF EXISTS vdb_log CASCADE;
CREATE TABLE vdb_log (
	idLog SERIAL PRIMARY KEY,
	idCli INT,
	name_cli VARCHAR(60),
	idBike INT,
	name_bk VARCHAR(40),
	idStationOut INT,
	name_stOut VARCHAR(40),
	slotOut INT,
	idStationIn INT,
	name_stIn VARCHAR(40),
	slotIn INT,
	state BOOLEAN DEFAULT FALSE, -- FALSE = NÃO RECEBIDO
	regOutDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	regInDate TIMESTAMP
);
-- FUNCTIONS

DROP FUNCTION IF EXISTS open_vdb_log(vdb_log.idCli%TYPE,vdb_log.idBike%TYPE,bike_station.idStation%TYPE,station_slot.slot%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION open_vdb_log(vdb_log.idCli%TYPE,vdb_log.idBike%TYPE,bike_station.idStation%TYPE,station_slot.slot%TYPE)
RETURNS VOID AS $$
DECLARE
	cli_temp client_vdb%ROWTYPE;
	bk_temp bike%ROWTYPE;
	st_temp bike_station%ROWTYPE;
BEGIN
	SELECT * INTO cli_temp FROM client_vdb WHERE idCli = $1;
	SELECT * INTO bk_temp FROM bike WHERE idBike = $2;
	SELECT * INTO st_temp FROM bike_station WHERE idStation = $3;
	IF (cli_temp IS NOT NULL) AND (bk_temp IS NOT NULL) AND (st_temp IS NOT NULL) AND (cli_temp.state) AND (cli_temp.onBike = FALSE) AND (bk_temp.state) AND (st_temp.state) THEN
		INSERT INTO vdb_log (idCli,name_cli,idBike,name_bk,idStationOut,name_stOut,slotOut)
		VALUES (cli_temp.idCli,cli_temp.username,bk_temp.idBike,bk_temp.name,st_temp.idStation,st_temp.name,$4);
	ELSE
		RAISE EXCEPTION 'Não foi possível realizar um empréstimo' USING HINT = 'Por favor, cheque os dados que estão sendo enviados';
	END IF;
END;
$$ LANGUAGE plpgsql;


DROP FUNCTION IF EXISTS close_vdb_log(client_vdb.idCli%TYPE,bike.idBike%TYPE,bike_station.idStation%TYPE,station_slot.slot%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION close_vdb_log(client_vdb.idCli%TYPE,bike.idBike%TYPE,bike_station.idStation%TYPE,station_slot.slot%TYPE)
RETURNS VOID AS $$
DECLARE
	out_log vdb_log.idLog%TYPE;
	st_temp bike_station%ROWTYPE;
BEGIN
	SELECT idLog INTO out_log FROM vdb_log WHERE idCli = $1 AND idBike = $2 AND state = FALSE;
	SELECT * INTO st_temp FROM bike_station WHERE idStation = $3;
	IF (out_log IS NOT NULL) AND (st_temp IS NOT NULL) THEN
		UPDATE vdb_log SET
			idStationIn = st_temp.idStation,
			name_stIn = st_temp.name,
			slotIn = $4,
			state = TRUE,
			regInDate = CURRENT_TIMESTAMP
		WHERE idLog = out_log;
	ELSE
		RAISE EXCEPTION 'Não foi possível realizar uma devolução' USING HINT = 'Por favor, cheque os dados que estão sendo enviados';
	END IF;
END;
$$ LANGUAGE plpgsql;

DROP TYPE IF EXISTS dup_result CASCADE;
CREATE TYPE dup_result AS (total BIGINT, now BIGINT);
DROP FUNCTION IF EXISTS getCountAllLogs() CASCADE;
CREATE OR REPLACE FUNCTION getCountAllLogs()
RETURNS dup_result AS $$
DECLARE
	res dup_result%ROWTYPE;
BEGIN
	SELECT COUNT(*) INTO res.total FROM vdb_log;
	SELECT COUNT(*) INTO res.now FROM vdb_log WHERE state = FALSE;
	RETURN res;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getvdbLogs() CASCADE;
CREATE OR REPLACE FUNCTION getvdbLogs()
RETURNS SETOF vdb_log AS $$
BEGIN
	RETURN QUERY
	SELECT * FROM vdb_log;
END;
$$ LANGUAGE plpgsql;


DROP FUNCTION IF EXISTS getvdbLogsSt(bike_station.idStation%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getvdbLogsSt(bike_station.idStation%TYPE)
RETURNS SETOF vdb_log AS $$
BEGIN
	RETURN QUERY
	SELECT  * FROM vdb_log WHERE idStationOut = $1 OR idStationIn = $1;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getvdbLogsBk(bike.idBike%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getvdbLogsBk(bike.idBike%TYPE)
RETURNS SETOF vdb_log AS $$
BEGIN
	RETURN QUERY
	SELECT * FROM vdb_log WHERE idBike = $1;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getvdbLogsCli(client_vdb.idCli%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getvdbLogsCli(client_vdb.idCli%TYPE)
RETURNS SETOF vdb_log AS $$
BEGIN
	RETURN QUERY
	SELECT * FROM vdb_log WHERE idCli = $1;
END;
$$ LANGUAGE plpgsql;

DROP TYPE IF EXISTS dup_resultST CASCADE;
CREATE TYPE dup_resultST AS (totalOut BIGINT, totalIn BIGINT, now BIGINT);
DROP FUNCTION IF EXISTS getCountAllLogsSt(bike_station.idStation%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getCountAllLogsSt(bike_station.idStation%TYPE)
RETURNS dup_resultST AS $$
DECLARE
	res dup_resultST%ROWTYPE;
BEGIN
	SELECT COUNT(*) INTO res.totalOut FROM vdb_log WHERE idStationOut = $1;
	SELECT COUNT(*) INTO res.totalIn FROM vdb_log WHERE idStationIn = $1;
	SELECT COUNT(*) INTO res.now FROM vdb_log WHERE idStationOut = $1 AND state = FALSE;
	RETURN res;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getCountAllLogsCli(client_vdb.idCli%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getCountAllLogsCli(client_vdb.idCli%TYPE)
RETURNS BIGINT AS $$
DECLARE
	total BIGINT;
BEGIN
	SELECT COUNT(*) INTO total FROM vdb_log WHERE idCli = $1;
	RETURN total;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getBikeOfCli(client_vdb.idCli%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getBikeOfCli(client_vdb.idCli%TYPE)
RETURNS INT AS $$
DECLARE
	res INT;
BEGIN
	SELECT idBike INTO res FROM vdb_log WHERE idCli = $1 AND state = FALSE;
	RETURN res;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS getCountAllLogsBk(bike.idBike%TYPE) CASCADE;
CREATE OR REPLACE FUNCTION getCountAllLogsBk(bike.idBike%TYPE)
RETURNS BIGINT AS $$
DECLARE
	total BIGINT;
BEGIN
	SELECT COUNT(*) INTO total FROM vdb_log WHERE idBike = $1;
	RETURN total;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER'S
DROP FUNCTION IF EXISTS LogReg() CASCADE;
CREATE OR REPLACE FUNCTION LogReg() -- nome da função
RETURNS TRIGGER AS $inLogReg$
DECLARE
	name_bike bike.name%TYPE;
	name_st bike_station.name%TYPE;
	name_cli client_vdb.username%TYPE;
BEGIN
	IF (TG_OP = 'INSERT') THEN
		PERFORM changeOnBike(NEW.idCli);
		PERFORM upd_bikeOut(NEW.idBike);
		PERFORM changeSlotUse(NEW.idStationOut,NEW.slotOut);
		PERFORM add_history_cli(NEW.idCli,'Vai de bike - Retirou a bicicleta ' || NEW.name_bk || ' do ' || NEW.slotOut || 'º slot da estação ' || NEW.name_stOut,'L');
		PERFORM add_history_bike(NEW.idBike,'Vai de bike - Retirada do ' || NEW.slotOut ||  'º slot da estação ' || NEW.name_stOut || ' pelo usuário ' || NEW.name_cli,'L');
		PERFORM add_history_station(NEW.idStationOut,'Vai de bike - Bicicleta ' || NEW.name_bk || ' retirada do ' || NEW.slotOut || 'º slot pelo usuário ' || NEW.name_cli,'L');
		RETURN NEW;
	ELSEIF (TG_OP = 'UPDATE') THEN
		PERFORM changeOnBike(OLD.idCli);
		PERFORM upd_bikeIn(OLD.idBike,NEW.idStationIn,NEW.slotIn);
		PERFORM changeSlotUse(NEW.idStationIn,NEW.slotIn);
		PERFORM add_history_cli(OLD.idCli,'Vai de bike - Entregou a bicicleta ' || OLD.name_bk || ' no ' || NEW.slotIn || 'º slot da estação ' || NEW.name_stIn,'L');
		PERFORM add_history_bike(OLD.idBike,'Vai de bike - Entregue no ' || NEW.slotIn ||  'º slot da estação ' || NEW.name_stIn || ' pelo usuário ' || OLD.name_cli,'L');
		PERFORM add_history_station(NEW.idStationIn,'Vai de bike - Bicicleta ' || OLD.name_bk || ' entregue no ' || NEW.slotIn || 'º slot pelo usuário ' || OLD.name_cli,'L');
		RETURN NEW;
	END IF;
END;
$inLogReg$ LANGUAGE PLPGSQL; --linguagem SQL

DROP TRIGGER IF EXISTS log_vdb ON vdb_log CASCADE;
CREATE TRIGGER log_vdb 
AFTER INSERT OR UPDATE ON vdb_log
FOR EACH ROW EXECUTE PROCEDURE LogReg();


-- AREA DE TESTES

-- SELECT add_in_log();
-- SELECT add_out_log();

-- SELECT getCountOutLogs();
-- SELECT * FROM getOutLogs();
-- SELECT * FROM getOutLogBike(idBike);
-- SELECT * FROM getOutLogCli(idCli);
-- SELECT * FROM getOutLogStation(idStation);

-- SELECT getCountInLogs();
-- SELECT * FROM getInLogs();
-- SELECT * FROM getInLogBike(idBike);
-- SELECT * FROM getInLogCli(idCli);
-- SELECT * FROM getInLogStation(idStation);