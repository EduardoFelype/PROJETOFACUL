<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Lista de Livros</title></head>
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
