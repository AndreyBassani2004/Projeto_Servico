package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Connection.SingleConnectionBanco;
import Model.ModelAnuncio;
import Model.ModelDenunciaAnuncio;

public class DAOAvaliarAvaliacao {
	
	private Connection connection;
	
	ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
	
	public DAOAvaliarAvaliacao() {
		connection = SingleConnectionBanco.getConnection();
	}
	
	
	
	//sql
	
	public List<ModelDenunciaAnuncio> lisarDenunciaAnuncio() throws Exception{
		
		List<ModelDenunciaAnuncio> retorno = new ArrayList<ModelDenunciaAnuncio>();
		
		String sql = " SELECT * FROM denuncia_anuncio WHERE estado_denuncia = 'ANALISE';";
		PreparedStatement statement = connection.prepareStatement(sql);
		
		ResultSet rs = statement.executeQuery();

		while (rs.next()) {
			
			ModelDenunciaAnuncio modelDenunciaAnuncio = new ModelDenunciaAnuncio();
			
			modelDenunciaAnuncio.setId(rs.getLong("id"));
			modelDenunciaAnuncio.setNome_cliente(rs.getString(""));
			
		}
		
		
		
		return retorno;
	}
	
}
