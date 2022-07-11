package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;

public class DAOAnuncioRepository {

	private Connection connection;
	
	private DAOUsuarioPosLogin daoUsuarioPosLogin = new DAOUsuarioPosLogin();

	public DAOAnuncioRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public void gravaAnuncio(ModelAnuncio modelAnuncio) throws Exception {
		String sql = "INSERT INTO anuncio(regiao, estado, titulo, descricao, servico, email_contato, id_prestador) VALUES (?, ?, ?, ?, ?, ?, ?);";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelAnuncio.getRegiao());
		preparedStatement.setString(2, modelAnuncio.getEstado());
		preparedStatement.setString(3, modelAnuncio.getTitulo());
		preparedStatement.setString(4, modelAnuncio.getDescricao());
		preparedStatement.setString(5, modelAnuncio.getServico());
		preparedStatement.setString(6, modelAnuncio.getEmail_contato());
		preparedStatement.setLong(7, modelAnuncio.getId_prestador().getId());
		
		preparedStatement.execute();
		
		connection.commit();
		
	}
	
	public void deleteAnuncio(Long id) throws Exception{
		String sql = "DELETE FROM anuncio WHERE id = ?; ";
	
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setLong(1, id);
				
		preparedStatement.execute();
		
		connection.commit();
	}
	
	
	public List<ModelAnuncio> listAnuncio(Long id_Prestador) throws Exception{
		
		List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();
		
		String sql = "select*from anuncio where id_prestador = ?;";
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		
		ResultSet rs = preparedStatement.executeQuery();
		
		while (rs.next()) {
			
			ModelAnuncio modelAnuncio = new ModelAnuncio();
			
			modelAnuncio.setId(rs.getLong("id"));
			modelAnuncio.setRegiao(rs.getString("regiao"));
			modelAnuncio.setEstado(rs.getString("estado"));
			modelAnuncio.setTitulo(rs.getString("titulo"));
			modelAnuncio.setDescricao(rs.getString("descricao"));
			modelAnuncio.setServico(rs.getString("servico"));
			modelAnuncio.setEmail_contato(rs.getString("email_contato"));
			modelAnuncio.setId_prestador(daoUsuarioPosLogin.consultaUsuarioId(rs.getLong("id_prestador")));
		
			retorno.add(modelAnuncio);
			
		}
		
		return retorno;
		
	}
}
