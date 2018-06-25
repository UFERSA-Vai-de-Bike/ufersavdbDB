-- TESTE PARA USER TESTE0_BD2 e TESTE_BD2 executar toda vez que dropar algo

-- revoke ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public from teste0_bd2;
-- revoke ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public from teste_bd2;

-- revoke ALL PRIVILEGES ON ALL TABLES IN SCHEMA public from teste0_bd2;
-- revoke ALL PRIVILEGES ON ALL TABLES IN SCHEMA public from teste_bd2;

-- revoke ALL PRIVILEGES ON DATABASE ufersa_vdb_2 from teste0_bd2;
-- revoke create,connect ON DATABASE ufersa_vdb_2 from teste_bd2;

-- GRANT insert,update,select ON ALL TABLES IN SCHEMA public TO teste0_bd2;

-- GRANT usage ON ALL SEQUENCES IN SCHEMA public TO teste0_bd2;

-- GRANT select ON ALL TABLES IN SCHEMA public TO teste_bd2;

-- GRANT connect ON DATABASE ufersa_vdb_2 TO teste_bd2;

-- GRANT connect ON DATABASE ufersa_vdb_2 TO teste0_bd2;



-- abaixo o teste0_bd2 deve executar tranquilamente e o outro não


-- SELECT createBikeStation('Aliada','xEqGAG',-5.206798,-37.323969);
-- SELECT createBikeStation('Olimpia','hbHevxu',-5.206798,-37.323969);
-- SELECT createBikeStation('Sang','hdCdj0ae',-5.206798,-37.323969);
-- SELECT createBikeStation('Milda','e8FADM4nzxf',-5.206798,-37.323969);

-- SELECT changeStationState(1);
-- SELECT changeStationState(2);
-- SELECT changeStationState(3);
-- SELECT changeStationState(4);

-- SELECT assignslot(1);
-- SELECT assignslot(1);
-- SELECT assignslot(1);
-- SELECT assignslot(1);
-- SELECT assignslot(2);
-- SELECT assignslot(2);
-- SELECT assignslot(2);
-- SELECT assignslot(2);
-- SELECT assignslot(3);
-- SELECT assignslot(3);
-- SELECT assignslot(3);
-- SELECT assignslot(3);
-- SELECT assignslot(4);
-- SELECT assignslot(4);
-- SELECT assignslot(4);
-- SELECT assignslot(4);

-- SELECT changeSlotState(1,1);
-- SELECT changeSlotState(1,2);
-- SELECT changeSlotState(1,3);
-- SELECT changeSlotState(1,4);

-- SELECT changeSlotState(2,1);
-- SELECT changeSlotState(2,2);
-- SELECT changeSlotState(2,3);
-- SELECT changeSlotState(2,4);

-- SELECT changeSlotState(3,1);
-- SELECT changeSlotState(3,2);
-- SELECT changeSlotState(3,3);
-- SELECT changeSlotState(3,4);

-- SELECT changeSlotState(4,1);
-- SELECT changeSlotState(4,2);
-- SELECT changeSlotState(4,3);
-- SELECT changeSlotState(4,4);



-- bikes

-- SELECT upd_bikeSt(8,4,2);
-- SELECT createBike('Eugena');
-- SELECT createBike('Leanne');
-- SELECT createBike('Tawana');
-- SELECT createBike('Bernardina');
-- SELECT createBike('Loraine');
-- SELECT createBike('Robena');
-- SELECT createBike('Zandra');
-- SELECT createBike('Jenise');

-- SELECT upd_bikeSt(1,1,1);
-- SELECT upd_bikeSt(2,1,2);
-- SELECT upd_bikeSt(3,2,1);
-- SELECT upd_bikeSt(4,2,2);
-- SELECT upd_bikeSt(5,3,1);
-- SELECT upd_bikeSt(6,3,2);
-- SELECT upd_bikeSt(7,4,1);



-- usuários


-- SELECT createClient(0,'r2','anarquia88');
-- SELECT createClient(0,'unhearty','anolandi55');
-- SELECT createClient(2,'kingrow','camilaqjin99');
-- SELECT createClient(3,'dipteran','siqueira73');
-- SELECT createClient(2,'pauxi','allefcurin43');
-- SELECT createClient(3,'underaid','killingin88');
-- SELECT createClient(0,'cardiophrenia','coracao22');
-- SELECT createClient(1,'armaria','qqussi44');


-- SELECT upd_info_cli(1,'Filonai Genot','fulc@treste.com','66665555','ouvinte','M','02-05-1991');
-- SELECT upd_info_cli(2,'Finn Genot','finnlc@teste.com','66665555','heroi','M','02-05-1991');
-- SELECT upd_info_cli(3,'Fanho Lance','fanho@teste.com','65467855','outsider','M','02-07-1999');
-- SELECT upd_info_cli(4,'Arere Umoki','aretw0@teste2.com','99768684','insider','M','25-05-1994');
-- SELECT upd_info_cli(5,'Blossom Mahaley','koil@cabot.co.uk','30777804','toastmastery','M','2012-05-26');
-- SELECT upd_info_cli(6,'Debbie Willhelm','aldermanlike@histamine.org','68119266','thrips','F','2016-06-17');
-- SELECT upd_info_cli(7,'Shalanda Battenhouse','gastroscope@unenkindled.net','71110539','acuesthesia','F','2016-04-18');
-- SELECT upd_info_cli(8,'Cristine Marzinske','pharyngopneustal@cleavability.co.uk','86460736','episiotomy','M','2016-12-27');

-- SELECT changeSit(1);
-- SELECT changeSit(2);
-- SELECT changeSit(3);
-- SELECT changeSit(4);
-- SELECT changeSit(5);
-- SELECT changeSit(6);
-- SELECT changeSit(7);
-- SELECT changeSit(8);


-- abaixo o teste_bd2 deve executar tranquilamente (exemplo)

-- SELECT getHistsStation('');

-- select getStation(1);