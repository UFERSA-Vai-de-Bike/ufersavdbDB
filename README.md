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
GRANT USAGE ON SCHEMA public to ufersa_vdb;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO ufersa_vdb;
GRANT CONNECT ON DATABASE ufersa_vdb_1 to ufersa_vdb;
\c ufersa_vdb_1 -- O CÓDIGO ABAIXO DEVE SER EXECUTADO DENTRO DO DATABASE EM QUESTÃO
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO ufersa_vdb; -- Isto garante privilegios em futuras tabelas na base "ufersa_vdb_1"
GRANT USAGE ON SCHEMA public to ufersa_vdb; 
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO ufersa_vdb;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ufersa_vdb;
```

#### Referências

- [Criando um usuário e dando acesso no PostGreSQL](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e)
- [Peer authentication failed](https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
- [Permission denied](https://stackoverflow.com/questions/13497352/error-permission-denied-for-relation-tablename-on-postgres-while-trying-a-selec)

# Contribuindo

Ao contribuir com este repositório, por favor, discuta primeiro a mudança que você deseja fazer via *issue*, e-mail ou qualquer outro método com os proprietários deste repositório antes de fazer uma alteração.

Por favor, note que temos um código de conduta, por favor, siga-o em todas as suas interações com o projeto.

## Processo de *Pull request*

1.  Assegure-se de que quaisquer dependências de instalação ou construção sejam removidas antes do final da camada ao fazer uma *build*. 
2.  Atualize o README.md com detalhes das mudanças na interface, isso inclui novas variáveis de ambiente, portas expostas, locais de arquivos úteis e parâmetros do contêiner.
3.  Aumente os números de versão em qualquer arquivo de exemplo e o README.md para a nova versão que esta solicitação de extração representaria. O esquema de versionamento que usamos é [SemVer](https://semver.org/lang/pt-BR/).
4.  Você pode fazer merge do *pull request* uma vez que você tenha a assinatura de dois outros desenvolvedores, ou se você não tiver permissão para fazer isso, você pode solicitar o segundo revisor para fazer por você.

## Código de conduta

### Nosso compromisso

No interesse de promover um ambiente aberto e acolhedor, nós, como colaboradores e mantenedores, comprometemo-nos a tornar a participação em nosso projeto e em nossa comunidade uma experiência livre de assédio para todos, independentemente da idade, tamanho do corpo, deficiência, etnia, identidade e expressão de gênero. nível de experiência, nacionalidade, aparência pessoal, raça, religião ou identidade e orientação sexual.

### Nossos padrões

Exemplos de comportamento que contribuem para criar um ambiente positivo incluem:

* Usando linguagem acolhedora e inclusiva
* Ser respeitoso com pontos de vista e experiências diferentes
* Graciosamente aceitando críticas construtivas
* Concentrando-se no que é melhor para a comunidade
* Mostrando empatia em relação a outros membros da comunidade

Exemplos de comportamento inaceitável pelos participantes incluem:

* O uso de linguagem ou imagens sexualizadas e atenção sexual indesejada ou avanços
* Trolling, insultos / comentários depreciativos e ataques pessoais ou políticos
* Assédio público ou privado
* Publicação de informações privadas de outras pessoas, como endereço físico ou eletrônico, sem permissão explícita
* Outra conduta que poderia razoavelmente ser considerada inadequada em um ambiente profissional

### Nossas Responsabilidades

Os mantenedores do projeto são responsáveis por esclarecer os padrões de comportamento aceitável e devem tomar medidas corretivas apropriadas e justas em resposta a quaisquer casos de comportamento inaceitável.

Os mantenedores do projeto têm o direito e a responsabilidade de remover, editar ou rejeitar comentários, commits, códigos, edições do wiki, questões e outras contribuições que não estejam alinhadas a este Código de Conduta, ou banir temporariamente ou permanentemente qualquer colaborador por outros comportamentos que julgam inapropriado, ameaçador, ofensivo ou prejudicial.

### Escopo

Este Código de Conduta se aplica tanto nos espaços do projeto quanto nos espaços públicos quando um indivíduo está representando o projeto ou sua comunidade. Exemplos de representação de um projeto ou comunidade incluem o uso de um endereço de e-mail oficial do projeto, postagem por meio de uma conta oficial de mídia social ou a atuação como um representante nomeado em um evento on-line ou off-line. A representação de um projeto pode ser definida e esclarecida pelos mantenedores do projeto.

### Aplicação

Instâncias de comportamento abusivo, ofensivo ou inaceitável podem ser relatadas entrando em contato com a equipe do projeto em ufersavaidebike@gmail.com. Todas as reclamações serão analisadas e investigadas e resultarão em uma resposta considerada necessária e apropriada às circunstâncias. A equipe do projeto é obrigada a manter a confidencialidade em relação ao relator de um incidente. Mais detalhes sobre políticas específicas de execução podem ser postados separadamente.

Os mantenedores do projeto que não seguem ou aplicam o Código de Conduta de boa fé podem enfrentar repercussões temporárias ou permanentes, conforme determinado por outros membros da liderança do projeto.

### Atribuição
Este Código de Conduta é adaptado do Pacto do Colaborador, versão 1.4, disponível em http://contributor-covenant.org/version/1/4
