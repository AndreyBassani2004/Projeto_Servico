package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOCadastroPrestador {

	private Connection connection;

	public DAOCadastroPrestador() {
		connection = SingleConnectionBanco.getConnection();

	}
	
	public ModelLogin gravarUsuario(ModelLogin objeto) throws Exception{
		
		String sql = "INSERT INTO usuario(nome, email, perfil, senha, estado) VALUES (?, ?, ?, ?, ?);";
		String sql2 = "INSERT INTO public.dados_prestador(telefone_contato, estado, cidade, cep, email_user) VALUES (?, ?, ?, ?, ?);";
		
	
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);		
		preparedSql.setString(1, objeto.getNome());
		preparedSql.setString(2, objeto.getLogin());
		preparedSql.setString(3, objeto.getPerfil());
		preparedSql.setString(4, objeto.getSenha());
		preparedSql.setString(5, objeto.getEstado());
		
		preparedSql.execute();
		connection.commit();
		
		PreparedStatement preparedSql2 = connection.prepareStatement(sql2);
		preparedSql2.setString(1, objeto.getTelefone());
		preparedSql2.setString(2, objeto.getEstado());
		preparedSql2.setString(3, objeto.getCidade());
		preparedSql2.setString(4, objeto.getLogradouro());
		preparedSql2.setString(5, objeto.getLogin());
		
		preparedSql2.execute();
		connection.commit();
		
		
		
		return this.consultaUsuario(objeto.getLogin());
	}
	
	
	
		public void atualizaUsuario(ModelLogin objeto) throws Exception{
		
		String sql = "UPDATE usuario SET senha=?, estado=? WHERE email=?;";
		String sql2 = "UPDATE dados_prestador SET telefone_contato=?, estado=?, cidade=?, cep=? WHERE email_user=?;";
		
	
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);		
		preparedSql.setString(1, objeto.getSenha());
		preparedSql.setString(2, objeto.getEstado());
		preparedSql.setString(3, objeto.getLogin());
		
		preparedSql.execute();
		connection.commit();
		
		PreparedStatement preparedSql2 = connection.prepareStatement(sql2);
		preparedSql2.setString(1, objeto.getTelefone());
		preparedSql2.setString(2, objeto.getEstado());
		preparedSql2.setString(3, objeto.getCidade());
		preparedSql2.setString(4, objeto.getLogradouro());
		preparedSql2.setString(5, objeto.getLogin());
		
		preparedSql2.execute();
		connection.commit();
		
		
		
		if(objeto.getFotouser() != null && !objeto.getFotouser().isEmpty()) {
			String sql3 = "UPDATE usuario SET fotouser=?, extensaofotouser=? where email=?";
			
			connection.setAutoCommit(false);
			PreparedStatement prepareSql3 = connection.prepareStatement(sql3);
			prepareSql3 = connection.prepareStatement(sql3);
			prepareSql3.setString(1, objeto.getFotouser());
			prepareSql3.setString(2, objeto.getExtencaofotouser());
			prepareSql3.setString(3, objeto.getLogin());

			prepareSql3.execute();
			connection.commit();
		}
		
		
	}
	
	
	
	public ModelLogin consultaUsuario(String login) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select usuario.nome, usuario.email, usuario.perfil, usuario.senha, usuario.estado, dados_prestador.telefone_contato, \r\n"
				+ "dados_prestador.estado, dados_prestador.cep, dados_prestador.email_user, dados_prestador.cidade\r\n"
				+ "from usuario\r\n"
				+ "	inner join dados_prestador\r\n"
				+ " on usuario.email = dados_prestador.email_user\r\n"
				+ "where  usuario.email = '"+login+"';";
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
	
	
	public boolean validarLogin(String login) throws Exception{
		String sql = "select count(1) > 0 as existe from usuario where upper(email) = upper('"+login+"');";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		resultado.next();//Para entrar nos resultados do sql
		return resultado.getBoolean("existe");
	}
		
}
