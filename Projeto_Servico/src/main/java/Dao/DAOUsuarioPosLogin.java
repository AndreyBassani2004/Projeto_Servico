package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOUsuarioPosLogin {
	

	private Connection connection;
	
	private DAOLoginRepository daoLoginRepository = new DAOLoginRepository();
	

	public DAOUsuarioPosLogin() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	public ModelLogin consultaUsuarioLogado(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from usuario where upper(email) = upper('"+login+"');";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setLogin(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setUseradmin(resultado.getBoolean("useradmin"));
			modelLogin.setPerfil(resultado.getString("perfil"));
		}

		return modelLogin;

	}
}
