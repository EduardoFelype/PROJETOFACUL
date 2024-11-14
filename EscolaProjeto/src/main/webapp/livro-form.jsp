<html>
<head><title>Cadastro de Livro</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
        flex-direction: column;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f5f5f5;
        }
        h1 {
            font-size: 24px;
            color: #333;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        label, input[type="text"] {
            font-size: 14px;
            color: #555;
            margin-bottom: 10px;
        }
        input[type="text"], input[type="submit"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            outline: none;
        }
        input[type="text"] {
            width: 100%;
            font-size: 14px;
            color: #333;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 15px;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        a {
            display: inline-block;
            text-align: center;
            margin-top: 15px;
            color: #555;
            font-size: 14px;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #333;
        }
    </style></head>
<body>
    <h1>${livro != null ? 'Editar Livro' : 'Novo Livro'}</h1>

    <!-- Formulário para pesquisar livro por ID -->
    <form action="livro" method="get">
        <input type="hidden" name="action" value="search" required />  <!-- Adiciona o parâmetro action -->
        <label for="id">Pesquisar Livro por ID:</label>
        <input type="text" id="id" name="id" required/>
        <input type="submit" value="Pesquisar"/>
    </form>

    <br/>

    <!-- Formulário de cadastro/edição de livro -->
    <form action="livro?action=${livro != null ? 'update' : 'insert'}" method="post">
        <input type="hidden" name="id" value="${livro != null ? livro.id : ''}" required/>
        Título: <input type="text" name="titulo" value="${livro != null ? livro.titulo : ''}"required /><br/>
        Autor: <input type="text" name="autor" value="${livro != null ? livro.autor : ''}" required/><br/>
        Ano de Publicação: <input type="text" name="anoPublicacao" value="${livro != null ? livro.anoPublicacao : ''}"required /><br/>
        <input type="submit" value="Salvar"/>
    </form>

    <br/>
    <a href="livro?action=list">Cancelar</a>
</body>
</html>
