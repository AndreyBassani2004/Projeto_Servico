package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;
import Model.ModelDenunciaAvaliacao;
import Model.ModelMensagem;

public class DAOAvaliarRequisicao {
	
	private Connection connection;
	
	ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
	
	public DAOAvaliarRequisicao() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public List<ModelDenunciaAnuncio> lisarDenunciaAnuncio(Long offset) throws Exception{
		
		List<ModelDenunciaAnuncio> retorno = new ArrayList<ModelDenunciaAnuncio>();
		
		String sql = "SELECT * FROM denuncia_anuncio WHERE estado_denuncia = 'ANALISE' offset " + offset + " limit 5; ";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			
			ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
			
			modelDenunciaAnuncio.setId(rs.getLong("id"));
			modelDenunciaAnuncio.setId_anuncio(rs.getLong("id_anuncio"));
			modelDenunciaAnuncio.setNome_cliente(rs.getString("nome_cliente"));
			modelDenunciaAnuncio.setSituacao(rs.getString("estado_denuncia"));
			modelDenunciaAnuncio.setMotivo(rs.getString("motivo"));
			
			retorno.add(modelDenunciaAnuncio);
		}
		
		return retorno;
	}
	
	
	public List<ModelDenunciaAnuncio> lisarDenunciaAnuncioAprovado(Long offset) throws Exception{
		
		List<ModelDenunciaAnuncio> retorno = new ArrayList<ModelDenunciaAnuncio>();
		
		String sql = "SELECT * FROM denuncia_anuncio WHERE estado_denuncia = 'Aprovar' offset " + offset + " limit 5; ";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			
			ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
			
			modelDenunciaAnuncio.setId(rs.getLong("id"));
			modelDenunciaAnuncio.setId_anuncio(rs.getLong("id_anuncio"));
			modelDenunciaAnuncio.setNome_cliente(rs.getString("nome_cliente"));
			modelDenunciaAnuncio.setSituacao(rs.getString("estado_denuncia"));;
			modelDenunciaAnuncio.setMotivo(rs.getString("motivo"));
			
			retorno.add(modelDenunciaAnuncio);
		}
		
		return retorno;
	}
	
	
	public List<ModelDenunciaAvaliacao> listarDenunciaAvaliacao(Long offset) throws Exception{
		
		List<ModelDenunciaAvaliacao> retorno = new ArrayList<ModelDenunciaAvaliacao>();
		
		String sql = "SELECT * FROM denuncia_avaliacao where estado_denuncia = 'ANALISE' offset " + offset + " limit 5;";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();
		
		while(rs.next()) {
			
			ModelDenunciaAvaliacao ModelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
			
			ModelDenunciaAvaliacao.setId(rs.getLong("id"));
			ModelDenunciaAvaliacao.setId_prestador(rs.getLong("id_prestador"));
			ModelDenunciaAvaliacao.setDescricao(rs.getString("descricao"));
			ModelDenunciaAvaliacao.setEstado_denuncia(rs.getString("estado_denuncia"));
			ModelDenunciaAvaliacao.setId_avaliacao(rs.getLong("id_avaliacao"));
			ModelDenunciaAvaliacao.setMotivo(rs.getString("motivo"));
			
			retorno.add(ModelDenunciaAvaliacao);
			
		}		
		
		return retorno;
	}
	
	public List<ModelAvaliacao> listarAvaliacaoesValidar(Long offset) throws Exception{
		
		List<ModelAvaliacao> retorno = new ArrayList<ModelAvaliacao>();
		
		String sql = "SELECT * FROM avaliacao_anuncio WHERE situacao = 'ANALISE' offset " + offset + " limit 5; ";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();
		
		while (rs.next()) {
			
			ModelAvaliacao modelAvaliacao = new ModelAvaliacao();
			
			modelAvaliacao.setId(rs.getLong("id"));
			modelAvaliacao.setId_anuncio(rs.getLong("id_anuncio"));
			modelAvaliacao.setNome_cliente(rs.getString("nome_cliente"));
			modelAvaliacao.setTitulo(rs.getString("titulo"));
			modelAvaliacao.setEstado(rs.getString("situacao"));
			
			retorno.add(modelAvaliacao);
		}
		
		return retorno;
	}
	
	
	public int totalPaginaDenunciaAvaliacao() throws Exception {

		String sql = "select count(1) as total from  denuncia_avaliacao where estado_denuncia = 'ANALISE';";
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
	
	
	public int totalPaginaAvaliacao() throws Exception {

		String sql = "select count(1) as total from avaliacao_anuncio where situacao = 'ANALISE';";
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
	
	public int totalPaginaDenunciaAnuncio() throws Exception {

		String sql = "select count(1) as total from denuncia_anuncio where estado_denuncia = 'ANALISE';";
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
	
	public int totalPaginaDenunciaAnuncioAprovado() throws Exception {

		String sql = "select count(1) as total from denuncia_anuncio where estado_denuncia = 'Aprovar';";
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
	


	public ModelDenunciaAvaliacao carregarDenunciaAvaliacao(Long id_avaliacao) throws Exception {
		
		ModelDenunciaAvaliacao modelDenunciaAvaliacao = new ModelDenunciaAvaliacao();
		
		String sql = "SELECT*FROM denuncia_avaliacao where id = "+ id_avaliacao+" ;";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			modelDenunciaAvaliacao.setId(resultado.getLong("id"));
			modelDenunciaAvaliacao.setId_anuncio(resultado.getLong("id_anuncio"));
			modelDenunciaAvaliacao.setId_prestador(resultado.getLong("id_prestador"));
			modelDenunciaAvaliacao.setDescricao(resultado.getString("estado_denuncia"));
			modelDenunciaAvaliacao.setId_avaliacao(resultado.getLong("id_avaliacao"));
			modelDenunciaAvaliacao.setMotivo(resultado.getString("motivo"));
			modelDenunciaAvaliacao.setFotoAvaliacao(resultado.getString("foto"));
			modelDenunciaAvaliacao.setExtfotoAvaliacao(resultado.getString("extensaofoto"));
		}
		
		String sql2 = "SELECT*FROM avaliacao_anuncio where id = "+ modelDenunciaAvaliacao.getId_avaliacao() +";";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		
		ResultSet resultado2 = statement2.executeQuery();
		
		while(resultado2.next()) {
			modelDenunciaAvaliacao.setNome_cliente(resultado2.getString("nome_cliente"));
			modelDenunciaAvaliacao.setEmail_cliente(resultado2.getString("email_cliente"));
			modelDenunciaAvaliacao.setDescricao_avaliacao(resultado2.getString("descricao"));
			modelDenunciaAvaliacao.setNota(resultado2.getLong("nota"));
			modelDenunciaAvaliacao.setTitulo(resultado2.getString("titulo"));
			modelDenunciaAvaliacao.setData_prestacao(resultado2.getDate("data_prestacao"));;
			modelDenunciaAvaliacao.setFoto(resultado2.getString("foto"));
			modelDenunciaAvaliacao.setExtfoto(resultado2.getString("fotoExtencao"));
			}
		
		String sql3 = "SELECT*FROM usuario where id = "+ modelDenunciaAvaliacao.getId_prestador() +";";
		PreparedStatement statement3 = connection.prepareStatement(sql3);
		
		ResultSet resultado3 = statement3.executeQuery();
		
		while(resultado3.next()) {
			modelDenunciaAvaliacao.setEmail_prestador(resultado3.getString("email"));
		}
		
		return modelDenunciaAvaliacao;
	}
	
	
	public void providenciaDenunciaAvaliacao(ModelDenunciaAvaliacao objeto) throws Exception{
		
		String sql = "UPDATE denuncia_avaliacao SET  estado_denuncia=?, relatorio=?, id_adm_situacao=? WHERE id=?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, objeto.getEstado_denuncia());
		preparedSql.setString(2, objeto.getRelatorio());
		preparedSql.setLong(3, objeto.getId_adm());
		preparedSql.setLong(4, objeto.getId());
		
		preparedSql.execute();
		connection.commit();
		
	}
	
	public void providenciaDenunciaAnuncioAtualizar(ModelDenunciaAnuncio objeto) throws Exception{
		
		String sql = "UPDATE denuncia_anuncio SET estado_denuncia = ? WHERE id=?;";
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, objeto.getSituacao());
		preparedSql.setLong(2, objeto.getId());
		
		
		preparedSql.execute();
		connection.commit();
	}
	
	public void desativarAvaliacao(Long id_avaliacao) throws Exception{
		
		String sql = "UPDATE avaliacao_anuncio SET situacao=? WHERE id = ?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, "DESATIVADO");
		preparedSql.setLong(2, id_avaliacao);
		
		
		preparedSql.execute();
		connection.commit();
		
	}
	
	
	public void providenciaDenunciaAnuncio(ModelDenunciaAnuncio objeto) throws Exception{
		
		String sql = "UPDATE denuncia_anuncio SET estado_denuncia=?, relatorio=?, id_adm_situacao=? WHERE id=?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, objeto.getSituacao());
		preparedSql.setString(2, objeto.getRelatorio());
		preparedSql.setLong(3, objeto.getId_adm());
		preparedSql.setLong(4, objeto.getId());
		
		preparedSql.execute();
		connection.commit();
		
	}
	
	public void EnviarMensagem(ModelMensagem objeto) throws Exception{
		
		String sql = "INSERT INTO mensagem(msg, id_remetente, id_destinatario, titulo) VALUES (?, ?, ?, ?);";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, objeto.getMensagem());
		preparedSql.setLong(2, objeto.getId_remetente());
		preparedSql.setLong(3, objeto.getId_destinatario());
		preparedSql.setString(4, objeto.getTitulo());
		
		preparedSql.execute();
		connection.commit();
	}
	
	public void desativarAnuncio(Long id_anuncio) throws Exception{
		
		String sql = "UPDATE anuncio SET situacao=? WHERE id=?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, "BANIDO");
		preparedSql.setLong(2, id_anuncio);
		
		preparedSql.execute();
		connection.commit();
	}
	
	public void desativarConta(Long id_user) throws Exception{
		
		String sql = "UPDATE anuncio SET situacao='BANIDO' WHERE id_prestador = ?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setLong(1, id_user);
		
		preparedSql.execute();
		connection.commit();
		
		String sql2 = "UPDATE usuario SET situacao_user='DESATIVADO' WHERE id= ?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql2 = connection.prepareStatement(sql2);
		preparedSql2.setLong(1, id_user);
		
		preparedSql2.execute();
		connection.commit();
	}
	
	public void ignorarDenunciaAnuncio(Long id_denuncia) throws Exception{
		
		String sql = "UPDATE denuncia_anuncio SET estado_denuncia=? WHERE id=?;";
		
		connection.setAutoCommit(false);
		PreparedStatement preparedSql = connection.prepareStatement(sql);
		preparedSql.setString(1, "IGNORADO");
		preparedSql.setLong(2, id_denuncia);
		
		preparedSql.execute();
		connection.commit();
	}
	
	public List<ModelMensagem> listarMensagensUser(Long id_user, Long offset) throws Exception{
		
		List<ModelMensagem> retorno = new ArrayList<ModelMensagem>();
		String sql = "SELECT*FROM mensagem where id_destinatario= "+ id_user +" offset "+ offset +" limit 5;";
		
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			
			ModelMensagem modelMensagem = new ModelMensagem();
			
			modelMensagem.setId(rs.getLong("id"));
			modelMensagem.setMensagem(rs.getString("msg"));
			modelMensagem.setTitulo(rs.getString("titulo"));	
			
			retorno.add(modelMensagem);
		}
		
		return retorno;
		
	}
	
	
	public int totalPaginaMensagem(Long id_user) throws Exception {

		String sql = "select count(1) as total from mensagem where id_destinatario = "+ id_user +";";
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
	
}
