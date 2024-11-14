<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Lista de Livros</title></head>
<body>
<h1>Lista de Livros</h1>
<!-- Bot�o de Novo Livro -->
<a href="livro?action=new">Novo Livro</a>

<!-- Formul�rio de Pesquisa -->


<!-- Tabela de Livros -->
<table border="1">
    <tr>
        <th>ID</th>
        <th>T�tulo</th>
        <th>Autor</th>
        <th>Ano de Publica��o</th>
        <th>A��es</th>
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
