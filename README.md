Sistema de Cadastro de Livros - Biblioteca
Este projeto é um sistema simples de cadastro de livros para uma biblioteca, desenvolvido utilizando Java EE, Servlets, JSP e MySQL. O sistema permite realizar operações CRUD (Create, Read, Update, Delete) para gerenciar informações de livros, como título, autor e data de publicação.

Funcionalidades
Incluir: Adicionar novos livros à base de dados.
Pesquisar: Buscar livros cadastrados por título.
Alterar: Editar as informações de um livro já cadastrado.
Excluir: Remover um livro da base de dados.
Tecnologias Utilizadas
Back-end: Servlets (Java EE)
Front-end: JSP (JavaServer Pages)
Banco de Dados: MySQL
IDE: Eclipse ou IntelliJ (recomendado para desenvolvimento Java EE)
Servidor de Aplicação: Apache Tomcat ou similar
JDBC: Para a conexão com o banco de dados MySQL
Instruções para Execução
1. Configuração do Banco de Dados
Antes de rodar o sistema, é necessário configurar o banco de dados MySQL.

Criação do Banco de Dados e Tabela

Execute o seguinte script SQL para criar o banco de dados e a tabela de livros:

sql
Copiar código
CREATE DATABASE biblioteca;

USE biblioteca;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    data_publicacao DATE
);
2. Configuração do Projeto
Clone o repositório para seu ambiente local:

bash
Copiar código
git clone https://github.com/EduardoFelype/PROJETOFACUL.git
Importe o projeto para a sua IDE (Eclipse, IntelliJ, etc.).

Configure a conexão com o banco de dados:

Localize o arquivo db.properties no projeto e altere os parâmetros de conexão com o banco de dados MySQL, conforme abaixo:

properties
Copiar código
db.url=jdbc:mysql://localhost:3306/biblioteca
db.username=root
db.password=sua_senha
Dependências: Se você estiver usando Maven, adicione as dependências do JDBC e do Servlet API no arquivo pom.xml:

xml
Copiar código
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>4.0.1</version>
    <scope>provided</scope>
</dependency>
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>8.0.26</version>
</dependency>
Compile e Rode o Projeto:

Configure o servidor Apache Tomcat na sua IDE e faça o deploy do projeto.
Inicie o servidor e acesse o sistema pelo navegador.
Estrutura de Diretórios
A estrutura de diretórios do projeto é a seguinte:

bash
Copiar código
/EscolaProjeto
    /src
        /dao
            LivroDAO.java           # Classe responsável pelas operações CRUD no banco de dados
        /model
            Livro.java              # Classe de modelo de dados do livro
        /servlet
            LivroServlet.java       # Servlet responsável pelo processamento das requisições
        /webapp
            /WEB-INF
                web.xml             # Arquivo de configuração do servlet
            /pages
                listaLivros.jsp     # Página para exibir a lista de livros
                cadastrarLivro.jsp  # Página para cadastrar um novo livro
                editarLivro.jsp     # Página para editar informações de um livro
Como Usar
Acessar o Sistema:

Acesse o sistema através do seguinte link:
http://localhost:8080/EscolaProjeto/livro.
Na página inicial, você verá a lista de livros cadastrados. É possível editar ou excluir livros diretamente da lista.
