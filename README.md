[Português]

# ufersavdbDB
Projeto de banco de dados do UFERSA Vai de Bike

Olá, seja bem vindo.

Este manual tem como propósito te ensinar a configurar uma máquina para que possa executar o banco de dados do sistema UFERSA Vai de Bike.

Autor: Arthur Aleksandro, aka [@aretw0](https://github.com/aretw0), arthursilva.dev@gmail.com.

Este projeto foi feito utilizando **PostGreSQL**.

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

Dentro da pasta [*queries*](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/tree/master/queries) se encontram os arquivos que instanciam as tabelas utilizadas pelo sistema.

#### Execute nessa ordem:

1. station.sql
2. bike.sql
3. client.sql
4. in-out.sql

>Cada arquivo tem no final um povoamento de tabelas. Você decide utilizar ou não.

>No repositório há um [arquivo](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/blob/master/bd1-project.sublime-project) referente à configuração do projeto no Sublime. Configure de acordo com o seu computador e aproveite para utilizar o build system que criei.

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
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO ufersa_vdb; -- Isto garante privilégios em futuras tabelas na base "ufersa_vdb_1"
GRANT USAGE ON SCHEMA public to ufersa_vdb; 
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO ufersa_vdb;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ufersa_vdb;
```

# Contribuindo

Ao contribuir com este repositório pedimos a gentileza de discutir primeiro a mudança que você deseja fazer via _issue_, e-mail ou qualquer outro método com os proprietários deste repositório antes de fazer uma alteração.

Note que temos um código de conduta. Por favor, siga-o em todas as suas interações com o projeto.

## Processo de *Pull request*

1.  Assegure-se de que quaisquer dependências de instalação ou construção sejam removidas antes do final da camada ao fazer uma *build*. 
2.  Atualize o README.md com detalhes das mudanças na interface, isso inclui novas variáveis de ambiente, portas expostas, locais de arquivos úteis e parâmetros do container.
3.  Aumente os números de versão em qualquer arquivo de exemplo e o README.md para a nova versão que esta solicitação de extração representaria. O esquema de versionamento que usamos é [SemVer](https://semver.org/lang/pt-BR/).
4.  Você pode fazer merge do *pull request* uma vez que você tenha a assinatura de dois outros desenvolvedores, ou se você não tiver permissão para fazer isso, você pode solicitar o segundo revisor para fazer por você.

## Código de conduta

### Nosso compromisso

No interesse de promover um ambiente aberto e acolhedor, nós, como colaboradores e mantenedores, comprometemo-nos a tornar a participação em nosso projeto e em nossa comunidade uma experiência livre de assédio para todos, independentemente da idade, tamanho do corpo, deficiência, etnia, identidade e expressão de gênero, nível de experiência, nacionalidade, aparência pessoal, raça, religião ou identidade e orientação sexual.

### Nossos padrões

Exemplos de comportamento que contribuem para criar um ambiente positivo incluem:

- A utilização de linguagem acolhedora e inclusiva;
- O respeito com pontos de vista e experiências diferentes;
- A receptividade em relação às críticas construtivas;
- O foco no que é melhor para a comunidade;
- A empatia para com outros membros da comunidade.

Exemplos de comportamento inaceitável pelos participantes incluem:

- A utilização de linguagem ou imagens sexualizadas e atenção sexual indesejada ou avanços;
- _Trolling_, insultos e/ou comentários depreciativos e ataques pessoais ou políticos;
- O assédio público ou privado;
- A publicação de informações privadas de outras pessoas, como endereço físico ou eletrônico, sem permissão explícita;
- Outra conduta que poderia razoavelmente ser considerada inadequada em um ambiente profissional.

### Nossas Responsabilidades

Os mantenedores do projeto são responsáveis por esclarecer os padrões de comportamento aceitável e devem tomar as medidas corretivas apropriadas e justas em resposta a quaisquer casos de comportamento inaceitável.

Além disso, têm o direito e a responsabilidade de remover, editar ou rejeitar comentários, _commits_, códigos, edições do wiki, questões e outras contribuições que não estejam alinhadas a este Código de Conduta, ou banir temporariamente ou permanentemente qualquer colaborador por outros comportamentos que julgarem inapropriado, ameaçador, ofensivo ou prejudicial.

### Escopo

Este Código de Conduta se aplica, tanto nos espaços do projeto, quanto nos espaços públicos em que um indivíduo está representando o projeto ou sua comunidade. Exemplos de representação de um projeto ou comunidade incluem o uso de um endereço de e-mail oficial do projeto, postagem por meio de uma conta oficial de mídia social ou a atuação como um representante nomeado em um evento on-line ou off-line. A representação de um projeto pode ser definida e esclarecida pelos mantenedores do projeto.


### Aplicação

Instâncias de comportamento abusivo, ofensivo ou inaceitável podem ser relatadas entrando em contato com a equipe do projeto em ufersavaidebike@gmail.com. Todas as reclamações serão analisadas e investigadas e resultarão em uma resposta considerada necessária e apropriada às circunstâncias. A equipe do projeto é obrigada a manter a confidencialidade em relação ao relator de um incidente. Mais detalhes sobre políticas específicas de execução podem ser postados separadamente.

Os mantenedores do projeto que não seguem ou aplicam o Código de Conduta de boa fé podem enfrentar repercussões temporárias ou permanentes, conforme determinado por outros membros da liderança do projeto.

### Atribuição
Este Código de Conduta é adaptado do Pacto do Colaborador, versão 1.4, disponível em http://contributor-covenant.org/version/1/4

#### Referências

- [Criando um usuário e dando acesso no PostGreSQL](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e)
- [Peer authentication failed](https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
- [Permission denied](https://stackoverflow.com/questions/13497352/error-permission-denied-for-relation-tablename-on-postgres-while-trying-a-selec)

------------------------------------------------------------------------------------
[English]

# ufersavdbDB
UFERSA Vai de Bike database project

Hello, welcome.

This manual is intended to teach you how to configure a machine so that you can run the UFERSA Vai de Bike database.

Author: Arthur Aleksandro, aka [@aretw0](https://github.com/aretw0), arthursilva.dev@gmail.com.

This project was made using **PostGreSQL**

#### Database
```sql
DROP DATABASE IF EXISTS ufersa_vdb_1;
CREATE DATABASE ufersa_vdb_1;
```
or
```bash
$ sudo -u postgres createdb ufersa_vdb_1
```
>The database used (**in this branch**) is named * ufersa_vdb_1 *. It doesn't have to be this name but please note: **the [API](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI/blob/master/db/connector.js) needs to know what it is determined. Be careful when making modifications!** So far this is **the only branch** to which the [API do UFERSA Vai de Bike](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI) **has support**.

Inside the [*queries*](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/tree/master/queries) folder are the files that instantiate the tables used by the system.

#### Execute in this order:

1. station.sql
2. bike.sql
3. client.sql
4. in-out.sql

>Each file has a table population at the end. You decide to use it or not.

>In the repository there is a [file](https://github.com/UFERSA-Vai-de-Bike/ufersavdbDB/blob/master/bd1-project.sublime-project) regarding to the project's configuration in Sublime. Configure accordingly with your computer and enjoy using the build system I have created.

- For backup:
```bash $ pg_dump ufersa_vdb_1 > nome_do_backup```

- To restore:
```bash $ psql ufersa_vdb_1 < nome_do_backup```

#### User and Permissions (for the [API](https://github.com/UFERSA-Vai-de-Bike/ufersavdbAPI/blob/master/db/connector.js))
```sql
CREATE USER ufersa_vdb WITH ENCRYPTED PASSWORD 'bikesharing18';
GRANT USAGE ON SCHEMA public to ufersa_vdb;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO ufersa_vdb;
GRANT CONNECT ON DATABASE ufersa_vdb_1 to ufersa_vdb;
\c ufersa_vdb_1 -- THE CODE BELOW MUST BE RUN WITHIN THIS DATABASE
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO ufersa_vdb; -- This guarantees privileges on future tables in the "ufersa_vdb_1" database
GRANT USAGE ON SCHEMA public to ufersa_vdb; 
GRANT SELECT ON ALL SEQUENCES IN SCHEMA public TO ufersa_vdb;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ufersa_vdb;
```

# Contributing

By contributing to this repository we kindly discuss first the change you wish to make via issue, e-mail or any other method with the owners of this repository before making a change.

Note that we have a code of conduct. Please follow it in all your interactions with the project.

## Pull request process

1.  Ensure that any installation or build dependencies are removed before the end of the layer when making a build. 
2.  Update README.md with details of interface changes, this includes new environment variables, exposed ports, useful file locations, and container parameters.
3.  Increase the version numbers in any sample file and README.md to the new version that this extraction request would represent. The versioning scheme we use is [SemVer](https://semver.org/lang/pt-BR/).
4.  You can merge pull request once you have the signature of two other developers, or if you don't have permission to do so, you can request the second reviewer to do it for you.

## Code of Conduct

### Our compromise

In the interest of spreading an open and welcoming environment, we, as contributors and maintainers,commit ourselves to making participation in our project and our community a harassment-free experience for everyone regardless of age, body size, disability, ethnicity, gender identity and expression, level of experience, nationality, personal appearance, race, religion or identity and sexual orientation.

### Our Standards

Examples of behavior that contribute to creating a positive environment include:

- The use of welcoming and inclusive language;
- Respect with different points of view and experiences;
- Responsiveness to constructive criticism;
- Focus on what is best for the community;
- Empathy with other community members.

Examples of unacceptable behavior by participants include:

- The use of sexualized language or images and unwanted sexual attention or advances;
- Trolling, insults and / or derogatory comments and personal or political attacks;
- Public or private harassment;
- The posting of other people's private information, such as physical or electronic address, without explicit permission;
- Other conduct that could reasonably be considered inappropriate in a professional setting.

### Our Responsibilities

Project maintainers are responsible for clarifying standards of acceptable behavior and should take appropriate and fair corrective action in response to any cases of unacceptable behavior.

In addition, they have the right and responsibility to remove, edit or reject comments, commits, codes, wiki edits, questions and other contributions that are not in line with this Code of Conduct, or to temporarily or permanently ban any contributor for other behaviors that deem inappropriate, threatening, offensive or harmful.

### Scope

This Code of Conduct applies in both project spaces and public spaces where an individual is representing the project or its community. Examples of representing a project or community include using an official project e-mail address, posting through an official social media account, or acting as a nominated representative at an online or offline event. The representation of a project can be defined and clarified by the project maintainers.

### Application

Instances of abusive, offensive or unacceptable behavior can be reported by contacting the project team at ufersavaidebike@gmail.com. All complaints will be reviewed and investigated and will result in a response deemed necessary and appropriate to the circumstances. The project team is required to maintain confidentiality with respect to the rapporteur of an incident. More details on specific execution policies can be posted separately.

Project maintainers who do not follow or apply the Code of Conduct in good faith may face temporary or permanent repercussions as determined by other members of the project leadership.

### Assignment

This Code of Conduct is adapted to the Employee Pact, version 1.4, available at http://contributor-covenant.org/version/1/4

#### References

- [Creating user, database and adding access on PostgreSQL](https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e)
- [Peer authentication failed](https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
- [Permission denied](https://stackoverflow.com/questions/13497352/error-permission-denied-for-relation-tablename-on-postgres-while-trying-a-selec)
