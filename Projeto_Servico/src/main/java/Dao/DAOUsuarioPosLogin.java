package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOUsuarioPosLogin {
	

	private Connection connection;

	public DAOUsuarioPosLogin() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	public ModelLogin consultaUsuarioLogado(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where upper(login) = upper('" + login + "');";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setLogin(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
		}

		return modelLogin;

	}
}
