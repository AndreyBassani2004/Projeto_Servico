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
		
		
		String sql2 = "SELECT*FROM anuncio where id = "+ modelAvaliacao.getId_anuncio() +";";
		PreparedStatement statement2 = connection.prepareStatement(sql2);
		ResultSet resultado2 = statement2.executeQuery();
		
		while (resultado2.next()) {
			modelAvaliacao.setEmail_prestador(resultado2.getString("email_contato"));
		}

		return modelAvaliacao;

	}
	
	public ModelDenunciaAnuncio consultaDenuncia(Long id_anuncio) throws Exception{
		
		ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
		
		String sql = "SELECT*FROM denuncia_anuncio where id = "+ id_anuncio +";";
		PreparedStatement statement = connection.prepareStatement(sql);
		ResultSet resultado = statement.executeQuery();
		
		while(resultado.next()) {
			modelDenunciaAnuncio.setId(resultado.getLong("id"));
			modelDenunciaAnuncio.setId_prestador(resultado.getLong("id_anuncio"));
		}
		
		return modelDenunciaAnuncio;
		
	}
}
