package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;
import Model.ModelAvaliacao;
import Model.ModelLogin;

public class DAOGerenciarSistemaRepository {
	
	private Connection connection;
	
	public DAOGerenciarSistemaRepository() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public int totalPaginaAnunciosBanido() throws Exception {

		String sql = "select count(1) as total from anuncio where situacao = 'BANIDO';";
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
	
	public List<ModelAnuncio> listarAnunciosBanido(Long offset) throws Exception{
		
		List<ModelAnuncio> modelAnuncios = new ArrayList<ModelAnuncio>();
		
		String sql = "select*from anuncio where situacao = 'BANIDO' offset "+ offset +" limit 5; ";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet rs = statement.executeQuery();

		while (rs.next()) {

			ModelAnuncio modelAnuncio = new ModelAnuncio();

			modelAnuncio.setId(rs.getLong("id"));
			modelAnuncio.setId_prestador2(rs.getLong("id_prestador"));
			modelAnuncio.setRegiao(rs.getString("regiao"));
			modelAnuncio.setEstado(rs.getString("estado"));
			modelAnuncio.setTitulo(rs.getString("titulo"));
			modelAnuncio.setDescricao(rs.getString("descricao"));
			modelAnuncio.setServico(rs.getString("servico"));
			modelAnuncio.setSituacao(rs.getString("situacao"));
			modelAnuncio.setEmail_contato(rs.getString("email_contato"));
			modelAnuncio.setFoto(rs.getString("fotoanuncio"));
			modelAnuncio.setExtFoto(rs.getString("extensaofotoanuncio"));
			
			modelAnuncios.add(modelAnuncio);

		}

		return modelAnuncios;
		
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
			modelAnuncio.setFoto(resultado.getString("fotoanuncio"));
			modelAnuncio.setExtFoto(resultado.getString("extensaofotoanuncio"));
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
	
	public ModelAvaliacao carregarNotaMediaAvaliacao (Long id_anuncio) throws Exception{
		
		ModelAvaliacao modelAvaliacao = new ModelAvaliacao();
		
		String sql = "SELECT AVG(nota) AS mediaNota FROM avaliacao_anuncio where id_anuncio = ? and situacao = 'APROVADO';";		
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_anuncio);

		ResultSet resultado = statement.executeQuery();
		
		while (resultado.next()) /* Se tem resultado */ {
			modelAvaliacao.setNota_media(resultado.getLong("mediaNota"));
		}
		
		return modelAvaliacao;
	}
	
	
	public List<ModelAvaliacao> listAvaliacaoPaginada(Long id_anuncio, Integer offset) throws Exception{
		
		List<ModelAvaliacao> retorno = new ArrayList<ModelAvaliacao>();
		
		String sql = "SELECT*FROM avaliacao_anuncio where id_anuncio = "+ id_anuncio +" and situacao = 'APROVADO' offset "+ offset +" limit 5;";
		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet rs = statement.executeQuery();
		
		while (rs.next()) {
			
			ModelAvaliacao modelAvaliacao = new ModelAvaliacao();
			
			modelAvaliacao.setId(rs.getLong("id"));
			modelAvaliacao.setNome_cliente(rs.getString("nome_cliente"));
			modelAvaliacao.setNota(rs.getDouble("nota"));
			modelAvaliacao.setTitulo(rs.getString("descricao_servico"));
			modelAvaliacao.setDescricao(rs.getString("descricao"));
			
			retorno.add(modelAvaliacao);
		}
		
		return retorno;
	}
	
	public int totalPaginaAvaliacao(Long id_anuncio) throws Exception {

		String sql = "select count(1) as total from avaliacao_anuncio where id_anuncio = '" + id_anuncio + "' and situacao = 'APROVADO';";
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
	
	
	public void ativarAnuncio(Long id_anuncio) throws Exception{
		
		String sql = "UPDATE public.anuncio SET situacao='ATIVO' WHERE id=?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_anuncio);
		
		statement.execute();

		connection.commit();
	}
	
	public List<ModelLogin> listPerfilsPrestadorBanido(Long offset) throws Exception{
		
		List<ModelLogin> retorno = new ArrayList<ModelLogin>();
		
		String sql = "SELECT id, nome, email, situacao_user FROM usuario where situacao_user='DESATIVADO' and perfil='PRESTADOR' offset "+offset+" limit 5;";
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
	
	public int totalPaginaPerfilPrestBanido() throws Exception {

		String sql = "select count(1) as total from usuario where situacao_user='DESATIVADO' and perfil='PRESTADOR';";
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
	
	public ModelLogin carregarPerfilBanido(Long id) throws Exception{
		
		ModelLogin modelLogin = new ModelLogin();
		String sql = "SELECT id, nome, email, situacao_user FROM usuario where perfil='PRESTADOR' and id=? ;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id);
		
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()) {
			modelLogin.setId(rs.getLong("id"));
			modelLogin.setNome(rs.getString("nome"));
			modelLogin.setLogin(rs.getString("email"));
			modelLogin.setSituacao_user(rs.getString("situacao_user"));
		}
		
		return modelLogin;
	}
	
	public void ativarPerfil(Long id) throws Exception{
		
		String sql = "UPDATE usuario SET situacao_user='ATIVO' WHERE id=?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id);
		
		statement.execute();

		connection.commit();
		
	}
	
	public void pausarAnuncios(Long id) throws Exception{
	
		String sql = "UPDATE anuncio SET situacao='PAUSADO' WHERE id_prestador=?;";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id);
		
		statement.execute();

		connection.commit();
				
	}
	
}
