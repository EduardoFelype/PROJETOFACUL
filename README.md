# Sistema de Cadastro de Livros - Biblioteca

Este projeto é uma aplicação web para gerenciamento de livros em uma biblioteca, utilizando Java Servlets, JSP (JavaServer Pages) e MySQL. O sistema permite realizar operações CRUD (Create, Read, Update, Delete) em uma tabela de livros, onde cada livro possui informações como título, autor e data de publicação.

## Funcionalidades

- **Cadastro de livros**: Inclusão de novos livros no banco de dados.
- **Listagem de livros**: Exibição de todos os livros cadastrados.
- **Pesquisa de livros**: Busca de livros pelo título.
- **Edição de livros**: Alteração das informações de livros já cadastrados.
- **Exclusão de livros**: Remoção de livros do banco de dados.

## Tecnologias Utilizadas

- **Back-end**: Java Servlets para processamento de requisições HTTP.
- **Front-end**: JSP (JavaServer Pages) para exibição de dados e interação com o usuário.
- **Banco de Dados**: MySQL para armazenar os dados dos livros.
- **Tomcat**: Servidor de aplicação utilizado para rodar os Servlets e JSP.

## Requisitos

- **Java 8** ou superior.
- **Apache Tomcat 9**.
- **MySQL 5.x** ou superior.

## Estrutura do Banco de Dados

O banco de dados MySQL contém a tabela `livros` com a seguinte estrutura:

```sql
CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255),
    data_publicacao DATE
);
