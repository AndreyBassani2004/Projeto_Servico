package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOLoginRepository {

	private Connection connection;

	public DAOLoginRepository() {
		connection = SingleConnectionBanco.getConnection();

	}
	
	public boolean validarAutenticacao(ModelLogin modelLogin) throws Exception {

		String sql = "select * from usuario where upper(email) = upper(?) and upper(senha) = upper(?) ";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, modelLogin.getLogin());
		statement.setString(2, modelLogin.getSenha());

		ResultSet resultSet = statement.executeQuery();

		if(resultSet.next()) {
			return true; //Autenticado
		}

		return false; //Nao Autenticado

	}
	
	
	public ModelLogin consultarUsuarioLogado(String login) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select usuario.id usuario.nome, usuario.email, usuario.perfil, usuario.senha, usuario.estado, dados_prestador.telefone_contato, \r\n"
				+ "dados_prestador.estado, dados_prestador.cep, dados_prestador.email_user, dados_prestador.cidade\r\n"
				+ "from usuario\r\n"
				+ "	inner join dados_prestador\r\n"
				+ " on usuario.email = dados_prestador.email_user\r\n"
				+ "where  usuario.email = '"+login+"';";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelLogin.setId(resultado.getLong("id"));
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
