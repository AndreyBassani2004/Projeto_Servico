package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOCadastroAdm {
	
	private Connection connection;
	
	public DAOCadastroAdm() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public boolean validarLogin(String login) throws Exception{
		String sql = "select count(1) > 0 as existe from usuario where upper(email) = upper('"+login+"');";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		resultado.next();//Para entrar nos resultados do sql
		return resultado.getBoolean("existe");
	}
	
	
	public ModelLogin gravarUsuario(ModelLogin objeto, Long userLogado) throws Exception{
		
		String sql = "INSERT INTO usuario(nome, email, perfil, senha, estado) VALUES (?, ?, ?, ?, ?);";
		String sql2 = "INSERT INTO dados_administrador(telefone_contato, estado, cidade, cep, email_user, user_id) VALUES (?, ?, ?, ?, ?, ?);";
		
	
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
		preparedSql2.setLong(6, userLogado);

		
		preparedSql2.execute();
		connection.commit();
		
		
		
		return this.consultaUsuario(objeto.getLogin());
	}
	
	
	public ModelLogin consultaUsuario(String login) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		
		String sql = "select usuario.nome, usuario.email, usuario.perfil, usuario.senha, usuario.estado,dados_administrador.telefone_contato, \r\n"
				+ "dados_administrador.estado, dados_administrador.cep, dados_administrador.email_user, dados_administrador.cidade\r\n"
				+ "from usuario\r\n"
				+ "	inner join dados_administrador\r\n"
				+ " on usuario.email = dados_administrador.email_user\r\n"
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
	
	
	public void atualizaUsuario(ModelLogin objeto) throws Exception{
		
		String sql = "UPDATE usuario SET senha=?, estado=? WHERE email=?;";
		String sql2 = "UPDATE dados_administrador SET telefone_contato=?, estado=?, cidade=?, cep=? WHERE email_user=?;";
		
	
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);		
		preparedSql.setString(1, objeto.getSenha());
		preparedSql.setString(2, objeto.getEstado());
		preparedSql.setString(3, objeto.getLogin());
		
		preparedSql.execute();
		connection.commit();
		
		PreparedStatement preparedSql2 = connection.prepareStatement(sql2);
		preparedSql2.setString(1, objeto.getTelefone_adm());
		preparedSql2.setString(2, objeto.getEstado());
		preparedSql2.setString(3, objeto.getCidade_adm());
		preparedSql2.setString(4, objeto.getLogradouro_adm());
		preparedSql2.setString(5, objeto.getLogin());
		
		preparedSql2.execute();
		connection.commit();
		
		
	}
}
