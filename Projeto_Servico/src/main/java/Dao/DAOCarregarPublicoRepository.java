package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;
import Model.ModelLogin;

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
		
		public ModelAnuncio consultarAnuncioID(Long id_anuncio) throws Exception {

			ModelAnuncio modelAnuncio = new ModelAnuncio();

			String sql = "SELECT * FROM anuncio where id = ?";
			PreparedStatement statement = connection.prepareStatement(sql);
			statement.setLong(1, id_anuncio);

			ResultSet resultado = statement.executeQuery();

			while (resultado.next()) {
				modelAnuncio.setId(resultado.getLong("id"));
				modelAnuncio.setId_prestador2(resultado.getLong("id_prestador"));
				modelAnuncio.setRegiao(resultado.getString("regiao"));
				modelAnuncio.setEstado(resultado.getString("estado"));
				modelAnuncio.setTitulo(resultado.getString("titulo"));
				modelAnuncio.setDescricao(resultado.getString("descricao"));
				modelAnuncio.setServico(resultado.getString("servico"));
				modelAnuncio.setEmail_contato(resultado.getString("email_contato"));
				modelAnuncio.setSituacao(resultado.getString("situacao"));
			}
			
			
			String sql2 = "select*from usuario where id = ?;";
			PreparedStatement statement2 = connection.prepareStatement(sql2);
			statement2.setLong(1, modelAnuncio.getId_prestador2());
			
			ResultSet resultado2 = statement2.executeQuery();

			while (resultado2.next()) /* Se tem resultado */ {
				modelAnuncio.setNome_prestador(resultado2.getString("nome"));
				modelAnuncio.setEmail_prestador_perfil(resultado2.getString("email"));
			}

			String sql3 = "select*from dados_prestador where email_user = ?;";
			PreparedStatement statement3 = connection.prepareStatement(sql3);
			statement3.setString(1, modelAnuncio.getEmail_prestador_perfil());
			
			ResultSet resultado3 = statement3.executeQuery();

			while (resultado3.next()) /* Se tem resultado */ {
				modelAnuncio.setTelefone_prestador(resultado3.getString("telefone_contato"));
			}
			
			return modelAnuncio;

		}
		
		
	
}
