<html>
<head><title>Cadastro de Livro</title></head>
<body>
    <h1>${livro != null ? 'Editar Livro' : 'Novo Livro'}</h1>

    <!-- Formulário para pesquisar livro por ID -->
    <form action="livro" method="get">
        <input type="hidden" name="action" value="search" />  <!-- Adiciona o parâmetro action -->
        <label for="id">Pesquisar Livro por ID:</label>
        <input type="text" id="id" name="id" />
        <input type="submit" value="Pesquisar" />
    </form>

    <br/>

    <!-- Formulário de cadastro/edição de livro -->
    <form action="livro?action=${livro != null ? 'update' : 'insert'}" method="post">
        <input type="hidden" name="id" value="${livro != null ? livro.id : ''}" />
        Título: <input type="text" name="titulo" value="${livro != null ? livro.titulo : ''}" /><br/>
        Autor: <input type="text" name="autor" value="${livro != null ? livro.autor : ''}" /><br/>
        Ano de Publicação: <input type="text" name="anoPublicacao" value="${livro != null ? livro.anoPublicacao : ''}" /><br/>
        <input type="submit" value="Salvar"/>
    </form>

    <br/>
    <a href="livro?action=list">Cancelar</a>
</body>
</html>
