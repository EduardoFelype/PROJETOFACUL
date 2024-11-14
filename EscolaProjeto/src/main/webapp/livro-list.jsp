<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Lista de Livros</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background-color: #f9f9f9;
            color: #333;
            padding: 20px;
        }
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        .container {
            width: 100%;
            max-width: 800px;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        a {
            color: #007BFF;
            text-decoration: none;
            font-size: 14px;
            margin-bottom: 15px;
            display: inline-block;
        }
        a:hover {
            color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        tr:hover {
            background-color: #e6f7ff;
        }
        .actions a {
            color: #007BFF;
            font-size: 14px;
            margin-right: 10px;
            text-decoration: none;
        }
        .actions a:hover {
            color: #0056b3;
        }
    </style></head>
<body>
<h1>Lista de Livros</h1>
<!-- Botão de Novo Livro -->
<a href="livro?action=new">Novo Livro</a>

<!-- Formulário de Pesquisa -->


<!-- Tabela de Livros -->
<table border="1">
    <tr>
        <th>ID</th>
        <th>Título</th>
        <th>Autor</th>
        <th>Ano de Publicação</th>
        <th>Ações</th>
    </tr>
    <c:forEach var="livro" items="${listLivro}">
        <tr>
            <td>${livro.id}</td>
            <td>${livro.titulo}</td>
            <td>${livro.autor}</td>
            <td>${livro.anoPublicacao}</td>
            <td>
                <a href="livro?action=edit&id=${livro.id}">Editar</a> | 
                <a href="livro?action=delete&id=${livro.id}">Deletar</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
