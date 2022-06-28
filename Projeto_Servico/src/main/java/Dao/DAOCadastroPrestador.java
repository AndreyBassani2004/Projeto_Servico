package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOCadastroPrestador {

	private Connection connection;

	public DAOCadastroPrestador() {
		connection = SingleConnectionBanco.getConnection();

	}
	
	public void gravarUsuario(ModelLogin objeto) throws Exception{
		
		String sql = "INSERT INTO usuario(nome, email, perfil, senha, estado) VALUES (?, ?, ?, ?, ?);";
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		
		preparedSql.setString(1, objeto.getNome());
		preparedSql.setString(2, objeto.getLogin());
		preparedSql.setString(3, objeto.getPerfil());
		preparedSql.setString(4, objeto.getSenha());
		preparedSql.setString(5, objeto.getEstado());
		
		preparedSql.execute();
		connection.commit();
	}
	
}
