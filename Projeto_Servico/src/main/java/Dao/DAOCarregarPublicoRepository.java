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
	
		public List<ModelAnuncio> listAnuncio2(String servico) throws Exception{
		
		List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();
		
		String sql = "select*from anuncio where servico = ? and situacao = 'ATIVO'; ";
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
