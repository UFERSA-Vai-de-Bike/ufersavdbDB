# ufersavdbDB
Projeto de banco de dados do UFERSA Vai de Bike


Olá, seja bem vindo.

Este manual tem como propósito te ensinar a configurar uma máquina para que possa executar o banco de dados do sistema UFERSA Vai de Bike.

Quaisquer dúvidas falar com o autor:

Arthur Aleksandro, aka @aretw0. Email: arthursilva.dev@gmail.com

=================================================
Utilizaremos:

1. postGreSQL
==============

 Dentro da pasta 'queries' se encontram os arquivos que instanciam as tabelas utilizado pelo sistema.

 O banco utilizado tem como nome: ufersa_vdb_2

 Não precisa ser esse nome e eu posso mostrar como alterar o sistema para trabalhar apontando pro banco que você determinar. Apenas as tabelas, funções e trigger's que importam.

 No final de cada arquivo tem um povoamento de tabelas. Você decide utilizar ou não.

 Execute nessa ordem:
 0. init.sql
 1. station.sql
 2. bike.sql
 3. client.sql
 4. in-out.sql
============================================

Obs.: No repositório vai alguns arquivos referentes a configuração do projeto no sublime, configure os caminhos de acordo com o seu computador e de quebra utilize o build system que eu criei.