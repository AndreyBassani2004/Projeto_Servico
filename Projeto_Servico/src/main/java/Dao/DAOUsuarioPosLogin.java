package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelDenunciaAvaliacao;
import Model.ModelLogin;

public class DAOUsuarioPosLogin {
	

	private Connection connection;
	
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
			modelLogin.setSituacao_user(resultado.getString("situacao_user"));
			modelLogin.setFotouser(resultado.getString("fotouser"));
			modelLogin.setExtencaofotouser(resultado.getString("extensaofotouser"));
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
	
	
	public void gravarDenunciaAvaliacao(ModelDenunciaAvaliacao objeto) throws Exception{
		
		String sql = "INSERT INTO denuncia_avaliacao(id_anuncio, id_prestador, descricao, estado_denuncia, id_avaliacao, motivo, foto, extensaofoto) VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);		
		preparedSql.setLong(1, objeto.getId_anuncio());
		preparedSql.setLong(2, objeto.getId_prestador());
		preparedSql.setString(3, objeto.getDescricao());
		preparedSql.setString(4, "ANALISE");
		preparedSql.setLong(5, objeto.getId_avaliacao());
		preparedSql.setString(6, objeto.getMotivo());
		preparedSql.setString(7, objeto.getFoto());
		preparedSql.setString(8, objeto.getExtfoto());
		
		preparedSql.execute();
		connection.commit();
	}
}
