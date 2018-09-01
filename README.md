# ufersavdbDB
Projeto de banco de dados do UFERSA Vai de Bike

Olá, seja bem vindo.

Este manual tem como propósito te ensinar a configurar uma máquina para que possa executar o banco de dados do sistema UFERSA Vai de Bike.

Autor: Arthur Aleksandro, aka [@aretw0](https://github.com/aretw0), arthursilva.dev@gmail.com.

Este projeto foi feito utilizando **PostGreSQL**

#### Banco
```sql
DROP DATABASE IF EXISTS ufersa_vdb_1;
CREATE DATABASE ufersa_vdb_1;
```
ou
```bash
$ sudo -u postgres createdb ufersa_vdb_1
```
>O banco utilizado (**neste branch**) tem como nome *ufersa_vdb_1*. Não precisa ser este nome mas atente-se: **a [API](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI/blob/master/db/connector.js) precisar saber o que for determinado. Cuidado ao fazer modificações!** Até o momento este é **o único branch** ao qual a [API do UFERSA Vai de Bike](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI) **tem suporte**.

Dentro da pasta [*queries*](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/tree/master/queries) se encontram os arquivos que instanciam as tabelas utilizado pelo sistema.

#### Execute nessa ordem:

1. station.sql
2. bike.sql
3. client.sql
4. in-out.sql

>Cada arquivo tem no final um povoamento de tabelas. Você decide utilizar ou não.

>No repositório vai um [arquivo](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/blob/master/bd1-project.sublime-project) referentes a configuração do projeto no sublime, configure de acordo com o seu computador e de quebra utilize o build system que criei.

- Para backup:
```bash $ pg_dump ufersa_vdb_1 > nome_do_backup```

- Para restaurar:
```bash $ psql ufersa_vdb_1 < nome_do_backup```

#### Usuário e permissões (para a [API](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI/blob/master/db/connector.js))
```sql
CREATE USER ufersa_vdb WITH ENCRYPTED PASSWORD 'bikesharing18';
GRANT ALL PRIVILEGES ON DATABASE ufersa_vdb_1 TO ufersa_vdb;
```
ou
```bash
$ sudo -u postgres createuser ufersa_vdb
$ sudo -u postgres psql
psql=# alter user ufersa_vdb with encrypted password 'bikesharing18';
psql=# grant all privileges on database ufersa_vdb_1 to ufersa_vdb;
```
>Quaisquer dúvidas siga o [manual](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e)
