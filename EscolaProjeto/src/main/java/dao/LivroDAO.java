package dao;

import model.Livro;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class LivroDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/biblioteca";
    private String jdbcUsername = "root";  // Ajuste o usuário
    private String jdbcPassword = "1234567";  // Ajuste a senha

    // Atualizando as SQLs para refletir o nome correto da tabela 'livros'
    private static final String INSERT_LIVRO_SQL = "INSERT INTO livros (titulo, autor, ano_publicacao) VALUES (?, ?, ?)";
    private static final String SELECT_LIVRO_BY_ID = "SELECT id, titulo, autor, ano_publicacao FROM livros WHERE id = ?";
    private static final String SELECT_ALL_LIVROS = "SELECT * FROM livros";
    private static final String DELETE_LIVRO_SQL = "DELETE FROM livros WHERE id = ?";
    private static final String UPDATE_LIVRO_SQL = "UPDATE livros SET titulo = ?, autor = ?, ano_publicacao = ? WHERE id = ?";

    // Método para obter a conexão com o banco de dados
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Carregando o driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            // Log de erro para ajudar na identificação do problema
            System.err.println("Erro ao conectar ao banco de dados: " + e.getMessage());
            throw new SQLException("Erro ao conectar ao banco de dados", e);
        }
        return connection;
    }

    // Método para inserir um novo livro no banco de dados
    public void insertLivro(Livro livro) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LIVRO_SQL)) {
            preparedStatement.setString(1, livro.getTitulo());
            preparedStatement.setString(2, livro.getAutor());
            preparedStatement.setInt(3, livro.getAnoPublicacao());
            preparedStatement.executeUpdate();
        }
    }

    // Método para buscar um livro pelo ID
    public Livro selectLivro(int id) {
        Livro livro = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_LIVRO_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                int anoPublicacao = rs.getInt("ano_publicacao");
                livro = new Livro(titulo, autor, anoPublicacao);
                livro.setId(id);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar livro com ID " + id + ": " + e.getMessage());
            e.printStackTrace();
        }
        return livro;
    }

    // Método para selecionar todos os livros
    public List<Livro> selectAllLivros() {
        List<Livro> livros = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_LIVROS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String titulo = rs.getString("titulo");
                String autor = rs.getString("autor");
                int anoPublicacao = rs.getInt("ano_publicacao");
                Livro livro = new Livro(titulo, autor, anoPublicacao);
                livro.setId(id);
                livros.add(livro);
            }
        } catch (SQLException e) {
            System.err.println("Erro ao buscar todos os livros: " + e.getMessage());
            e.printStackTrace();
        }
        return livros;
    }

    // Método para atualizar as informações de um livro
    public boolean updateLivro(Livro livro) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_LIVRO_SQL)) {
            statement.setString(1, livro.getTitulo());
            statement.setString(2, livro.getAutor());
            statement.setInt(3, livro.getAnoPublicacao());
            statement.setInt(4, livro.getId());

            rowUpdated = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao atualizar livro: " + e.getMessage());
            e.printStackTrace();
        }
        return rowUpdated;
    }

    // Método para deletar um livro pelo ID
    public boolean deleteLivro(int id) throws SQLException {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_LIVRO_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Erro ao deletar livro com ID " + id + ": " + e.getMessage());
            e.printStackTrace();
        }
        return rowDeleted;
    }
}
