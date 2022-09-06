package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;
import Model.ModelDenunciaAvaliacao;
import Model.ModelLogin;

public class DAOCarregarPublicoRepository {

	private Connection connection;

	public DAOCarregarPublicoRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public int totalPagina(String servico) throws Exception {

		String sql = "select count(1) as total from anuncio where servico = '" + servico + "' and situacao = 'ATIVO';";
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

	public List<ModelAnuncio> listAnuncio2(String servico) throws Exception {

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

	public List<ModelAnuncio> listAnuncioPaginada(String servico, Integer offset) throws Exception {

		List<ModelAnuncio> retorno = new ArrayList<ModelAnuncio>();

		String sql = "select*from anuncio where servico = ? and situacao = 'ATIVO' offset " + offset + " limit 5; ";
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
	
	public int totalPagina2(Long id_anuncio) throws Exception {

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

	public ModelAvaliacao carregarAnuncioAvaliarID(Long id_anuncio) throws Exception {

		ModelAvaliacao modelAvaliacao = new ModelAvaliacao();

		String sql = "SELECT * FROM anuncio where id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_anuncio);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			modelAvaliacao.setId_anuncio(resultado.getLong("id"));
			modelAvaliacao.setId_prestador(resultado.getLong("id_prestador"));
			modelAvaliacao.setServico_prestador(resultado.getString("servico"));
			modelAvaliacao.setUf(resultado.getString("estado"));
			modelAvaliacao.setTitulo_anuncio(resultado.getString("titulo"));
			modelAvaliacao.setDescricao(resultado.getString("descricao"));
		}

		String sql2 = "select*from usuario where id = ?;";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.setLong(1, modelAvaliacao.getId_prestador());

		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) /* Se tem resultado */ {
			modelAvaliacao.setNome_prestador(resultado2.getString("nome"));
		}

		return modelAvaliacao;

	}

	public void gravarAvaliacao(ModelAvaliacao objeto) throws Exception {

		String sql = "INSERT INTO public.avaliacao_anuncio(\r\n"
				+ "	id_anuncio, nome_cliente, email_cliente, descricao_servico, data_prestacao, nota, titulo, descricao, foto, \"fotoExtencao\")\r\n"
				+ "	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setLong(1, objeto.getId_anuncio());
		preparedSql.setString(2, objeto.getNome_cliente());
		preparedSql.setString(3, objeto.getEmail_cliente());
		preparedSql.setString(4, objeto.getDescricao_cliente());
		preparedSql.setString(5, objeto.getData_prestacao());
		preparedSql.setDouble(6, objeto.getNota());
		preparedSql.setString(7, objeto.getTitulo());
		preparedSql.setString(8, objeto.getDescricao());
		preparedSql.setString(9, objeto.getFoto());
		preparedSql.setString(10, objeto.getExtfoto());

		preparedSql.execute();
		connection.commit();

	}

	public ModelDenunciaAnuncio carregarAnuncioDenunciaID(Long id_anuncio) throws Exception {

		ModelDenunciaAnuncio modelDenunciaAvaliacao = new ModelDenunciaAnuncio();

		String sql = "SELECT * FROM anuncio where id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setLong(1, id_anuncio);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			modelDenunciaAvaliacao.setId_anuncio(resultado.getLong("id"));
			modelDenunciaAvaliacao.setId_prestador(resultado.getLong("id_prestador"));
			modelDenunciaAvaliacao.setServico_prestador(resultado.getString("servico"));
			modelDenunciaAvaliacao.setUf(resultado.getString("estado"));
			modelDenunciaAvaliacao.setTitulo_anuncio(resultado.getString("titulo"));
			modelDenunciaAvaliacao.setDescricao_anuncio(resultado.getString("descricao"));
		}

		String sql2 = "select*from usuario where id = ?;";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		statement2.setLong(1, modelDenunciaAvaliacao.getId_prestador());

		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) /* Se tem resultado */ {
			modelDenunciaAvaliacao.setNome_prestador(resultado2.getString("nome"));
		}

		return modelDenunciaAvaliacao;

	}
	
	public void cadastrarDenuncia(ModelDenunciaAnuncio objeto) throws Exception{
		String sql = "INSERT INTO public.denuncia_anuncio(\r\n"
				+ "	id_anuncio, nome_cliente, email_cliente, descricao_denuncia, estado_denuncia, motivo)\r\n"
				+ "	VALUES (?, ?, ?, ?, ?, ?);";
		
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setLong(1, objeto.getId_anuncio());
		preparedSql.setString(2, objeto.getNome_cliente());
		preparedSql.setString(3, objeto.getEmail_cliente());
		preparedSql.setString(4, objeto.getDescricao_denuncia());
		preparedSql.setString(5, "ANALISE");
		preparedSql.setString(6, objeto.getMotivo());
		
		preparedSql.execute();
		connection.commit();
		
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
	
	public ModelDenunciaAvaliacao carregarDenunciaAvaliacao(Long id_avaliacao, Long id_anuncio) throws Exception{
		
		ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
		
		String sql = "SELECT*FROM avaliacao_anuncio where id = "+id_avaliacao+" and id_anuncio = "+id_anuncio+";";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			modelDenunciaAvaliacao.setId(resultado.getLong("id"));
			modelDenunciaAvaliacao.setId_anuncio(resultado.getLong("id_anuncio"));
			modelDenunciaAvaliacao.setNome_cliente(resultado.getString("nome_cliente"));
			modelDenunciaAvaliacao.setEmail_cliente(resultado.getString("email_cliente"));
			modelDenunciaAvaliacao.setDescricao_avaliacao(resultado.getString("descricao"));
			modelDenunciaAvaliacao.setNota(resultado.getLong("nota"));
			modelDenunciaAvaliacao.setTitulo(resultado.getString("titulo"));
			modelDenunciaAvaliacao.setData_prestacao(resultado.getString("data_prestacao"));
			modelDenunciaAvaliacao.setFotoAvaliacao(resultado.getString("foto"));
			modelDenunciaAvaliacao.setExtfotoAvaliacao(resultado.getString("fotoExtencao"));
		}
		
		
		String sql2 = "SELECT * FROM anuncio where id="+id_anuncio+" ;";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		
		ResultSet resultado2 = statement2.executeQuery();
		
		while (resultado2.next()) {
			//modelDenunciaAvaliacao.setId_anuncio(resultado2.getLong("id_anuncio"));
			modelDenunciaAvaliacao.setEmail_prestador("email_contato");
		}
		
		return modelDenunciaAvaliacao;
	}
	
}
