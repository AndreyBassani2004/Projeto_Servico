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
	
	
	public void updateAnuncio(ModelAnuncio modelAnuncio) throws Exception {
		String sql = "UPDATE public.anuncio SET regiao=?, estado=?, titulo=?, descricao=?, servico=?, email_contato=?, situacao=? WHERE id=?;";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelAnuncio.getRegiao());
		preparedStatement.setString(2, modelAnuncio.getEstado());
		preparedStatement.setString(3, modelAnuncio.getTitulo());
		preparedStatement.setString(4, modelAnuncio.getDescricao());
		preparedStatement.setString(5, modelAnuncio.getServico());
		preparedStatement.setString(6, modelAnuncio.getEmail_contato());
		preparedStatement.setString(7, modelAnuncio.getSituacao());
		preparedStatement.setLong(8, modelAnuncio.getId());
		
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
	
	public List<ModelAnuncio> listAnuncio2(Long id_user) throws Exception{
		
		List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();
		
		String sql = "select*from anuncio where id_prestador = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_user);
		
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()) {
			
			ModelAnuncio modelAnuncio = new ModelAnuncio();
			
			modelAnuncio.setId(rs.getLong("id"));
			modelAnuncio.setRegiao(rs.getString("regiao"));
			modelAnuncio.setEstado(rs.getString("estado"));
			modelAnuncio.setTitulo(rs.getString("titulo"));
			modelAnuncio.setDescricao(rs.getString("descricao"));
			modelAnuncio.setServico(rs.getString("servico"));
			modelAnuncio.setSituacao(rs.getString("situacao"));
			modelAnuncio.setEmail_contato(rs.getString("email_contato"));
		
			retorno.add(modelAnuncio);
			
		}
		
		return retorno;
		
	}
	
	public void deletarAnuncio(Long id) throws Exception{
		
		String sql = "DELETE FROM anuncio WHERE id = ?;";	
		PreparedStatement prepareSql = connection.prepareStatement(sql);

		prepareSql.setLong(1, id);

		prepareSql.executeUpdate();

		connection.commit();
		
	}
	
	public ModelAnuncio consultarAnuncioID(Long id_user, Long id_anuncio) throws Exception{
		
		ModelAnuncio modelAnuncio = new ModelAnuncio();
		
		String sql = "SELECT * FROM anuncio where id = ? and id_prestador = ?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_anuncio);
		statement.setLong(2, id_user);
		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			modelAnuncio.setId(resultado.getLong("id"));
			modelAnuncio.setRegiao(resultado.getString("regiao"));
			modelAnuncio.setEstado(resultado.getString("estado"));
			modelAnuncio.setTitulo(resultado.getString("titulo"));
			modelAnuncio.setDescricao(resultado.getString("descricao"));
			modelAnuncio.setServico(resultado.getString("servico"));
			modelAnuncio.setEmail_contato(resultado.getString("email_contato"));
			modelAnuncio.setSituacao(resultado.getString("situacao"));
		}
		
		return modelAnuncio;
		
	}
}