package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Connection.SingleConnectionBanco;
import Model.ModelAvaliacao;
import Model.ModelDenunciaAnuncio;

public class DAOSistemaAdmRepository {

	private Connection connection;

	public DAOSistemaAdmRepository() {
		connection = SingleConnectionBanco.getConnection();

	}

	public ModelAvaliacao consultaAvaliacao(Long id_anuncio) throws Exception {

		ModelAvaliacao modelAvaliacao = new ModelAvaliacao();

		String sql = "SELECT*FROM avaliacao_anuncio where id = " + id_anuncio + ";";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) /* Se tem resultado */ {
			modelAvaliacao.setId(resultado.getLong("id"));
			modelAvaliacao.setId_anuncio(resultado.getLong("id_anuncio"));
			modelAvaliacao.setNome_cliente(resultado.getString("nome_cliente"));
			modelAvaliacao.setEmail_cliente(resultado.getString("email_cliente"));
			modelAvaliacao.setDescricao_anuncio(resultado.getString("descricao_servico"));
			modelAvaliacao.setNota(resultado.getDouble("nota"));
			modelAvaliacao.setTitulo(resultado.getString("titulo"));
			modelAvaliacao.setDescricao(resultado.getString("descricao"));
			modelAvaliacao.setData_prestacao(resultado.getString("data_prestacao"));
		}

		String sql2 = "SELECT*FROM anuncio where id = " + modelAvaliacao.getId_anuncio() + ";";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) {
			modelAvaliacao.setEmail_prestador(resultado2.getString("email_contato"));
		}

		return modelAvaliacao;

	}

	public ModelDenunciaAnuncio consultaDenuncia(Long id_anuncio) throws Exception {

		ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();

		String sql = "SELECT*FROM denuncia_anuncio where id = " + id_anuncio + ";";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			modelDenunciaAnuncio.setId(resultado.getLong("id"));
			modelDenunciaAnuncio.setId_anuncio(resultado.getLong("id_anuncio"));
			modelDenunciaAnuncio.setNome_cliente(resultado.getString("nome_cliente"));
			modelDenunciaAnuncio.setEmail_cliente(resultado.getString("email_cliente"));
			modelDenunciaAnuncio.setDescricao_denuncia(resultado.getString("descricao_denuncia"));
			modelDenunciaAnuncio.setMotivo(resultado.getString("motivo"));
		}

		String sql2 = "SELECT*FROM anuncio where id = " + modelDenunciaAnuncio.getId_anuncio() + ";";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) {
			modelDenunciaAnuncio.setId_prestador(resultado2.getLong("id_prestador"));
		}

		String sql3 = "SELECT*FROM usuario where id = " + modelDenunciaAnuncio.getId_prestador() + ";";
		PreparedStatement statement3 = connection.prepareStatement(sql3);
		ResultSet resultado3 = statement3.executeQuery();

		while (resultado3.next()) {
			modelDenunciaAnuncio.setNome_prestador(resultado3.getString("nome"));
			modelDenunciaAnuncio.setEmail_prestador(resultado3.getString("email"));
		}

		return modelDenunciaAnuncio;

	}

	public void atualizarAvaliacao(ModelAvaliacao modelAvaliacao) throws Exception {

		String sql = "UPDATE avaliacao_anuncio SET situacao=?, id_adm_situacao=? WHERE id = ?;";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, modelAvaliacao.getEstado());
		preparedStatement.setLong(2, modelAvaliacao.getId_adm_alterador());
		preparedStatement.setLong(3, modelAvaliacao.getId());

		preparedStatement.execute();

		connection.commit();
	}
	
	public ModelDenunciaAnuncio consultaDenunciaProvidencia(Long id_anuncio) throws Exception {

		ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();

		String sql = "SELECT*FROM denuncia_anuncio where id = " + id_anuncio + ";";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {
			modelDenunciaAnuncio.setId(resultado.getLong("id"));
			modelDenunciaAnuncio.setId_anuncio(resultado.getLong("id_anuncio"));
			modelDenunciaAnuncio.setNome_cliente(resultado.getString("nome_cliente"));
			modelDenunciaAnuncio.setEmail_cliente(resultado.getString("email_cliente"));
			modelDenunciaAnuncio.setDescricao_denuncia(resultado.getString("descricao_denuncia"));
			modelDenunciaAnuncio.setMotivo(resultado.getString("motivo"));
			modelDenunciaAnuncio.setId_adm(resultado.getLong("id_adm_situacao"));
			modelDenunciaAnuncio.setRelatorio(resultado.getString("relatorio"));
			modelDenunciaAnuncio.setSituacao(resultado.getString("estado_denuncia"));
		}

		String sql2 = "SELECT*FROM anuncio where id = " + modelDenunciaAnuncio.getId_anuncio() + ";";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		ResultSet resultado2 = statement2.executeQuery();

		while (resultado2.next()) {
			modelDenunciaAnuncio.setId_prestador(resultado2.getLong("id_prestador"));
		}

		String sql3 = "SELECT*FROM usuario where id = " + modelDenunciaAnuncio.getId_prestador() + ";";
		PreparedStatement statement3 = connection.prepareStatement(sql3);
		ResultSet resultado3 = statement3.executeQuery();

		while (resultado3.next()) {
			modelDenunciaAnuncio.setNome_prestador(resultado3.getString("nome"));
			modelDenunciaAnuncio.setEmail_prestador(resultado3.getString("email"));
		}

		return modelDenunciaAnuncio;

	}
}
