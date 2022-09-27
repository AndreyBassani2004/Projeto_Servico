package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelLogin;

public class DAOGerenciarContasRepository {
	
	private Connection connection;
	
	public DAOGerenciarContasRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	public int totalPaginaAdms() throws Exception {

		String sql = "select count(1) as total from usuario where perfil='ADMIN' and useradmin = false;";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		resultado.next();

		Double cadastros = resultado.getDouble("total");

		Double porpagina = 5.0;

		Double pagina = cadastros / porpagina;

		Double resto = pagina % 2;

		if (resto > 0) {
			pagina++;
		}

		return pagina.intValue();

	}
	
	
	
	public List<ModelLogin> listarAdms(Long offset) throws Exception{
		
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();
		
		String sql = "SELECT id, nome, email, situacao_user FROM usuario where perfil='ADMIN' and useradmin = false OFFSET "+offset+" LIMIT 5;";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			ModelLogin modelLogin = new ModelLogin();
			
			modelLogin.setId(rs.getLong("id"));
			modelLogin.setNome(rs.getString("nome"));
			modelLogin.setLogin(rs.getString("email"));
			modelLogin.setSituacao_user(rs.getString("situacao_user"));
			
			retorno.add(modelLogin);
		}
		
		return retorno;
	}
	
	
	public ModelLogin carregarDadosADM(Long id_user) throws Exception{
		
		
		ModelLogin modelLogin = new ModelLogin();
		String sql = "SELECT id, nome, email, situacao_user FROM usuario where id = ?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_user);
		
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()) {
			modelLogin.setId(rs.getLong("id"));
			modelLogin.setNome(rs.getString("nome"));
			modelLogin.setLogin(rs.getString("email"));
			modelLogin.setSituacao_user(rs.getString("situacao_user"));
		}
		
		return modelLogin;
	}
	
}
