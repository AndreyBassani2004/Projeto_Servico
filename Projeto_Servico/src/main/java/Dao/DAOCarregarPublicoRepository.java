package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;

public class DAOCarregarPublicoRepository {
	
	private Connection connection;
	
	public DAOCarregarPublicoRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public int totalPagina(String servico) throws Exception{
		
		String sql = "select count(1) as total from anuncio where servico = '"+servico+"' and situacao = 'ATIVO';";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();
		
		resultado.next();
		
		Double cadastros = resultado.getDouble("total");
		
		Double porpagina = 5.0;
		
		Double pagina = cadastros / porpagina;
		
		Double resto = pagina % 2;
		
		if(resto > 0) {
			pagina ++;
		}
		
		return pagina.intValue();
		
	}
	
		public List<ModelAnuncio> listAnuncio2(String servico) throws Exception{
		
		List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();
		
		String sql = "select*from anuncio where servico = ? and situacao = 'ATIVO' limit 5; ";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setString(1, servico);
		
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
	
	
		
		public List<ModelAnuncio> listAnuncioPaginada(String servico, Integer offset) throws Exception{
			
			List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();
			
			String sql = "select*from anuncio where servico = ? and situacao = 'ATIVO' offset "+offset+" limit 5; ";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setString(1, servico);
			
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
		
	
}
