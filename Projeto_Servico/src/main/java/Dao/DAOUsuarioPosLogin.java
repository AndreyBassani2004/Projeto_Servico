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
		

		return modelLogin;

	}
	
	
	public ModelLogin consultaUsuarioLogado2(String login) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select usuario.nome, usuario.email, usuario.perfil, usuario.senha, usuario.estado, dados_prestador.telefone_contato, dados_prestador.estado, dados_prestador.cep, dados_prestador.email_user, dados_prestador.cidade from usuario inner join dados_prestador on usuario.email = dados_prestador.email_user where  usuario.email = '"+login+"';";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelLogin.setLogin(resultado.getString("email"));
			modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setrSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setEstado(resultado.getString("estado"));
			modelLogin.setCidade(resultado.getString("cidade"));
			modelLogin.setLogradouro(resultado.getString("cep"));
			modelLogin.setTelefone(resultado.getString("telefone_contato"));
		}
		

		return modelLogin;
		
	}
}
