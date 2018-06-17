/*
USERID: ufersa_vdb
SENHA: bikesharing18
*/

-- CRIAÇÃO DO BANCO DE DADOS
/*DROP DATABASE IF EXISTS ufersa_vdb_2;
CREATE DATABASE ufersa_vdb_2;*/




 -- Para simular algum funcionamento prévio

-- abre 4 empréstimos
-- SELECT open_vdb_log(1,1,1,1);
-- SELECT open_vdb_log(2,3,2,1);
-- SELECT open_vdb_log(3,2,1,2);
-- SELECT open_vdb_log(4,4,2,2);

-- Fecha os dois primeiros
-- SELECT close_vdb_log(1,1,2,1);
-- SELECT close_vdb_log(2,3,1,1);




-- TRANSAÇÃO A
-- begin;
-- SELECT * FROM getBike(1);
-- SELECT open_vdb_log(1,1,1,1);
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

