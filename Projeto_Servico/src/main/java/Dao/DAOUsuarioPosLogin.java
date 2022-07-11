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
			modelLogin.setEstado(resultado.getString("estado"));
		}
		
		String sql2 = "select * from dados_prestador where upper(email_user) = upper('"+login+"');";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) /* Se tem resultado */ {
			modelLogin.setCidade(resultado2.getString("cidade"));
			modelLogin.setTelefone(resultado2.getString("telefone_contato"));
			modelLogin.setLogradouro(resultado2.getString("cep"));
		}
		
			String sql3 = "select * from dados_administrador where upper(email_user) = upper('"+login+"');";
			PreparedStatement statement3 = connection.prepareStatement(sql3);
			ResultSet resultado3 = statement3.executeQuery();

			while (resultado3.next()) /* Se tem resultado */ {
				modelLogin.setCidade_adm(resultado3.getString("cidade"));
				modelLogin.setTelefone_adm(resultado3.getString("telefone_contato"));
				modelLogin.setLogradouro_adm(resultado3.getString("cep"));
			}
		
		
		
		

		return modelLogin;

	}
	
	
	public ModelLogin consultaUsuarioId(Long id) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select*from usuario where id = ?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id);
		
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setLogin(resultado.getString("email"));
		}
		

		return modelLogin;
		
	}
}
