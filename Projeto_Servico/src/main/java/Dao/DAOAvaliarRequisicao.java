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

public class DAOAvaliarRequisicao {
	
	private Connection connection;
	
	ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
	
	public DAOAvaliarRequisicao() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	public List<ModelDenunciaAnuncio> lisarDenunciaAnuncio() throws Exception{
		
		List<ModelDenunciaAnuncio> retorno = new ArrayList<ModelDenunciaAnuncio>();
		
		String sql = "SELECT * FROM denuncia_anuncio WHERE estado_denuncia = 'ANALISE';";
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
	
	public List<ModelAvaliacao> listarAvaliacaoesValidar() throws Exception{
		
		List<ModelAvaliacao> retorno = new ArrayList<ModelAvaliacao>();
		
		String sql = "SELECT * FROM avaliacao_anuncio WHERE situacao = 'ANALISE';";
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
	
}
