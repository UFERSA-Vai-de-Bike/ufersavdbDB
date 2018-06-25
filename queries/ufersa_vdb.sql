/*
USERID: ufersa_vdb
SENHA: bikesharing18
*/

-- CRIAÇÃO DO BANCO DE DADOS
-- DROP DATABASE IF EXISTS ufersa_vdb_2;
-- CREATE DATABASE ufersa_vdb_2;

 -- Para simular algum funcionamento prévio

-- abre 4 empréstimos
-- SELECT open_vdb_log(1,1,1,1);
-- SELECT open_vdb_log(2,3,2,1);
-- SELECT open_vdb_log(3,2,1,2);
-- SELECT open_vdb_log(4,4,2,2);

-- Fecha os dois primeiros
-- SELECT close_vdb_log(1,1,2,1);
-- SELECT close_vdb_log(2,3,1,1);


-- select getHistsStation('U');

-- select getvdbLogs();

-- TRANSAÇÃO A
-- begin;
-- SELECT * FROM getBike(1);
-- SELECT open_vdb_log(1,1,1,1);
-- SELECT * FROM getBike(1);
-- rollback;
  
  
-- TRANSAÇÃO B
-- begin;
-- SELECT open_vdb_log(1,1,1,1);
-- SELECT * FROM getBike(1);
-- commit;


-- TRANSAÇÃO A
/*begin;
SELECT open_vdb_log(1,1,1,1);
SELECT * FROM getBike(1);
rollback;*/
  
  
-- TRANSAÇÃO B
/*begin;
SELECT * FROM getBike(1);
commit;*/

-- SELECT * FROM pg_user;

-- SELECT * FROM getBike(1);



-- SELECT createClient(0,'unhearty','anolandi55');
-- SELECT createClient(2,'kingrow','camilaqjin99');
-- SELECT createClient(3,'dipteran','siqueira73');
-- SELECT createClient(2,'pauxi','allefcurin43');
-- SELECT createClient(3,'underaid','killingin88');
-- SELECT createClient(0,'cardiophrenia','coracao22');
-- SELECT createClient(1,'armaria','qqussi44');



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




-- apresentação terça

-- SELECT createClient(0,'r2','anarquia88',('Filonai Genot','fulc@treste.com','66665555','ouvinte','M','02-05-1991'));
-- SELECT createClient(0,'unhearty','anolandi55',('Finn Genot','finnlc@teste.com','66665555','heroi','M','02-05-1991'));

-- SELECT upd_info_cli(1,('Filonia Ganet','r2@teste.com','64465555','Protagonis','M','25-05-1994'));
-- SELECT upd_info_cli(2,'Foon Genit','finn@teste.com','66665555','heroina','F','03-05-1993');


-- SELECT delClient(1);
-- SELECT getInfoCli(1);
-- SELECT getInfosCli();
-- SELECT getClients();

